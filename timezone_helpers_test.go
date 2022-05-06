package main

import (
	"fmt"
	"os"
	"path/filepath"
	"reflect"
	"testing"
)

func TestFindTimeZoneIndexEmpty(t *testing.T) {
	var timezones []TimeZone

	want := -1

	i := FindTimeZoneIndex(timezones, "Test 5")

	if i != want {
		t.Fatalf("%d, want %d", i, want)
	}
}

func TestFindTimeZoneIndexInvalid(t *testing.T) {
	timezones := []TimeZone{
		{
			Label:    "Test 1",
			Location: "Test Location 1",
		},
		{
			Label:    "Test 2",
			Location: "Test Location 2",
		},
		{
			Label:    "Test 3",
			Location: "Test Location 3",
		},
	}

	want := -1

	i := FindTimeZoneIndex(timezones, "Test 5")

	if i != want {
		t.Fatalf("%d, want %d", i, want)
	}
}

func TestFindTimeZoneIndex(t *testing.T) {
	timezones := []TimeZone{
		{
			Label:    "Test 1",
			Location: "Test Location 1",
		},
		{
			Label:    "Test 2",
			Location: "Test Location 2",
		},
		{
			Label:    "Test 3",
			Location: "Test Location 3",
		},
	}

	want := 1

	i := FindTimeZoneIndex(timezones, "Test 2")

	if i != want {
		t.Fatalf("%d, want %d", i, want)
	}
}

func TestGetTimeZones(t *testing.T) {
	var chatID int64 = 1

	timeZones := []TimeZone{
		{
			Label:    "Test 1",
			Location: "Test Location 1",
		},
		{
			Label:    "Test 2",
			Location: "Test Location 2",
		},
		{
			Label:    "Test 3",
			Location: "Test Location 3",
		},
	}

	for _, tz := range timeZones {
		AddTimeZone(chatID, tz)
	}

	actualTimeZones := GetTimeZones(chatID)

	filename := fmt.Sprintf("%d.csv", chatID)
	file := filepath.Join("timezones", filename)
	defer os.Remove(file)

	if !reflect.DeepEqual(actualTimeZones, timeZones) {
		t.Fatalf("%v, want %v", actualTimeZones, timeZones)
	}
}
