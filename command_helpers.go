package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
	"time"
)

func AddTimeZone(chatID int64, timeZone TimeZone) {
	filename := fmt.Sprintf("%d.csv", chatID)
	file := filepath.Join("timezones", filename)

	f, err := os.OpenFile(file, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatal(err)
	}

	w := csv.NewWriter(f)
	defer w.Flush()

	if err := w.Write(timeZone.Values()); err != nil {
		f.Close()
		log.Fatal(err)
	}
}

func AddTimeZones(chatID int64, timeZones []TimeZone) {
	filename := fmt.Sprintf("%d.csv", chatID)
	file := filepath.Join("timezones", filename)

	f, err := os.OpenFile(file, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatal(err)
	}

	w := csv.NewWriter(f)
	defer w.Flush()

	for _, tz := range timeZones {
		if err := w.Write(tz.Values()); err != nil {
			f.Close()
			log.Fatal(err)
		}
	}
}

func RemoveTimeZone(chatID int64, label string) {
	timeZones := GetTimeZones(chatID)

	if len(timeZones) == 0 {
		log.Fatalf("No time zones for chat %d", chatID)
	}

	i := FindTimeZoneIndex(timeZones, label)
	if i == -1 {
		log.Fatalf("Time zone %q not found", label)
	}

	copy(timeZones[i:], timeZones[i+1:])
	timeZones = timeZones[:len(timeZones)-1]

	filename := fmt.Sprintf("%d.csv", chatID)
	file := filepath.Join("timezones", filename)

	f, err := os.OpenFile(file, os.O_RDWR|os.O_TRUNC, 0644)
	if err != nil {
		log.Fatal(err)
	}

	if err := f.Close(); err != nil {
		log.Fatal(err)
	}

	AddTimeZones(chatID, timeZones)
}

func RemoveTimeZones(chatID int64) {
	filename := fmt.Sprintf("%d.csv", chatID)
	file := filepath.Join("timezones", filename)

	if err := os.Remove(file); err != nil {
		log.Fatal(err)
	}
}

func RemoveAllTimeZones() {
	if err := RemoveContents("timezones"); err != nil {
		log.Fatal(err)
	}
}

func DisplayTimeZones(chatID int64) string {
	timeZones := GetTimeZones(chatID)

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
