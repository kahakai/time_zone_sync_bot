package main

import (
	"fmt"
	"log"
	"strings"
	"time"
)

func DisplayTimeZones(timeZones []TimeZone) string {
	var sb strings.Builder

	now := time.Now()

	for _, tz := range timeZones {
		location, err := GetLocation(tz.Location)
		if err != nil {
			log.Println(err)
			continue
		}

		timeInZone := now.In(location)
		formattedTime := timeInZone.Format("Mon Jan _2 15:04:05 2006")

		fmt.Fprintf(&sb, "%s: %s %s\n", tz.Label, tz.Location, formattedTime)
	}

	return sb.String()
}
