package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"
)

func FindTimeZoneIndex(tzs []TimeZone, label string) int {
	for i := 0; i < len(tzs); i++ {
		if tzs[i].Label == label {
			return i
		}
	}

	return -1
}

func GetTimeZones(chatID int) []TimeZone {
	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	f, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}

	defer f.Close()

	r := csv.NewReader(f)

	var timezones []TimeZone

	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		if err != nil {
			log.Fatal(err)
		}

		tz := TimeZone{
			Label:    record[0],
			Location: record[1],
		}

		timezones = append(timezones, tz)
	}

	return timezones
}
