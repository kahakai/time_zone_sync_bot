package main

import (
	"log"
	"os"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func main() {
	bot, err := tgbotapi.NewBotAPI(os.Getenv("TELEGRAM_APITOKEN"))
	if err != nil {
		log.Panic(err)
	}

	bot.Debug = true

	updateConfig := tgbotapi.NewUpdate(0)
	updateConfig.Timeout = 30

	updates := bot.GetUpdatesChan(updateConfig)

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
