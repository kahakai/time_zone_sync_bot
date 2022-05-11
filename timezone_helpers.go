package main

import (
	"fmt"
	"log"
	"strings"
	"time"
)

func DisplayTime(timeZones []TimeZone, format TimeFormat) string {
	var sb strings.Builder

	now := time.Now()

	for _, tz := range timeZones {
		location, err := GetLocation(tz.Location)
		if err != nil {
			log.Println(err)
			continue
		}

		timeInZone := now.In(location)
		formattedTime := timeInZone.Format(format.Format())

		fmt.Fprintf(&sb, "<b>%s</b>: %s\n", tz.Label, formattedTime)
	}

	return sb.String()
}

func DisplayTimeZones(timeZones []TimeZone) string {
	var sb strings.Builder

	for _, tz := range timeZones {
		fmt.Fprintf(&sb, "<b>%s</b>: %s\n", tz.Label, tz.Location)
	}

	return sb.String()
}
