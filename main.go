package main

import (
	"log"
	"net/http"
	"os"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func main() {
	bot, err := tgbotapi.NewBotAPI(os.Getenv("TELEGRAM_APITOKEN"))
	if err != nil {
		log.Panic(err)
	}

	bot.Debug = true

	log.Printf("Authorized on account %s", bot.Self.UserName)

	port := os.Getenv("PORT")
	if port == "" {
		log.Fatal("$PORT must be set")
	}

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
		case "help":
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
		case "remove_timezones":
			msg.Text = RemoveTimeZonesCommand(chatID)
		case "clear_timezones":
			msg.Text = ClearTimeZonesCommand()
		case "time":
			msg.Text = TimeCommand(chatID)
		default:
			msg.Text = UnknownCommand()
		}

		if _, err := bot.Send(msg); err != nil {
			log.Panic(err)
		}
	}
}
