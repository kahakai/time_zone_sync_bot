package main

import (
	"context"
	"log"
	"net/http"
	"os"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
	"github.com/jackc/pgx/v4"
)

var (
	dbConn *pgx.Conn
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		log.Fatal("$PORT must be set")
	}

	conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatalf("Unable to connect to database: %v\n", err)
	}

	dbConn = conn
	defer dbConn.Close(context.Background())

	if err := PrepareDatabase(); err != nil {
		log.Fatal(err)
	}

	bot, err := tgbotapi.NewBotAPI(os.Getenv("TELEGRAM_APITOKEN"))
	if err != nil {
		log.Panic(err)
	}

	bot.Debug = true

	log.Printf("Authorized on account %s", bot.Self.UserName)

	wh, _ := tgbotapi.NewWebhook("https://warm-refuge-96898.herokuapp.com/" + bot.Token)

	_, err = bot.Request(wh)
	if err != nil {
		log.Fatal(err)
	}

	info, err := bot.GetWebhookInfo()
	if err != nil {
		log.Fatal(err)
	}

	if info.LastErrorDate != 0 {
		log.Printf("Telegram callback failed: %s", info.LastErrorMessage)
	}

	updates := bot.ListenForWebhook("/" + bot.Token)
	go http.ListenAndServe("0.0.0.0:"+port, nil)

	for update := range updates {
		if update.Message == nil {
			continue
		}

		if !update.Message.IsCommand() {
			continue
		}

		chatID := update.Message.Chat.ID
		msg := tgbotapi.NewMessage(chatID, "")

		switch update.Message.Command() {
		case "start":
			msg.Text = HelpCommand()
		case "add_timezone":
			args, err := HandleAddTimeZoneCommandArguments(update.Message.CommandArguments())
			if err != nil {
				msg.Text = err.Error()
				break
			}

			msg.Text = AddTimeZoneCommand(chatID, args)
		case "remove_timezone":
			args, err := HandleRemoveTimeZoneCommandArguments(update.Message.CommandArguments())
			if err != nil {
				msg.Text = err.Error()
				break
			}

			msg.Text = RemoveTimeZoneCommand(chatID, args)
		case "clear_timezones":
			msg.Text = ClearTimeZonesCommand(chatID)
		case "time":
			args, err := HandleTimeCommandArguments(update.Message.CommandArguments())
			if err != nil {
				msg.Text = err.Error()
				break
			}

			msg.Text = TimeCommand(chatID, args)
			msg.ParseMode = "HTML"
		case "timezones":
			msg.Text = TimeZonesCommand(chatID)
			msg.ParseMode = "HTML"
		case "help":
			msg.Text = HelpCommand()
		default:
			msg.Text = UnknownCommand()
		}

		if _, err := bot.Send(msg); err != nil {
			log.Panic(err)
		}
	}
}
