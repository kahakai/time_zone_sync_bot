package main

import (
	"fmt"
)

const help = `Available commands:
/add_timezone label timezone — Add new time zone
/remove_timezone label — Remove time zone with label
/clear_timezones — Remove all time zones
/time — Show time with time zones`

func HelpCommand() string {
	return help
}

func AddTimeZoneCommand(chatID int64, args AddTimeZoneArguments) string {
	timeZone := TimeZone{
		Label:    args.Label,
		Location: args.Location,
	}

	AddTimeZone(chatID, timeZone)

	return fmt.Sprintf("New time zone %q was added.\n", timeZone.Label)
}

func RemoveTimeZoneCommand(chatID int64, args RemoveTimeZoneArguments) string {
	RemoveTimeZone(chatID, args.Label)
	return fmt.Sprintf("Time zone %q was removed.\n", args.Label)
}

func ClearTimeZonesCommand() string {
	RemoveAllTimeZones()
	return "All time zones were cleared."
}

func TimeCommand(chatID int64) string {
	timeZones := DisplayTimeZones(chatID)

	if len(timeZones) == 0 {
		return "No time zones to show."
	}

	return DisplayTimeZones(chatID)
}

func UnknownCommand() string {
	return "Unknown command. User /help command."
}
