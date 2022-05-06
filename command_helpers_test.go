package main

import (
	"encoding/csv"
	"errors"
	"fmt"
	"io"
	"os"
	"reflect"
	"testing"
)

func TestAddTimeZoneFileExists(t *testing.T) {
	chatID := 1

	timeZone := TimeZone{
		Label:    "Test",
		Location: "Test Location",
	}

	AddTimeZone(chatID, timeZone)

	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	if _, err := os.Stat(filename); errors.Is(err, os.ErrNotExist) {
		t.Fatal(err)
	}

	if err := os.Remove(filename); err != nil {
		t.Fatal(err)
	}
}

func TestAddTimeZone(t *testing.T) {
	chatID := 1

	timeZone := TimeZone{
		Label:    "Test",
		Location: "Test Location",
	}

	AddTimeZone(chatID, timeZone)

	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	f, err := os.Open(filename)
	if err != nil {
		t.Fatal(err)
	}

	defer os.Remove(filename)
	defer f.Close()

	r := csv.NewReader(f)

	record, err := r.Read()

	actualTimeZone := TimeZone{
		Label:    record[0],
		Location: record[1],
	}

	if err == io.EOF {
		return
	}

	if err != nil {
		t.Fatal(err)
	}

	if actualTimeZone != timeZone {
		t.Fatalf("%v, want %v", record, timeZone)
	}
}

func TestAddTimeZones(t *testing.T) {
	chatID := 1

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

	AddTimeZones(chatID, timeZones)

	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	f, err := os.Open(filename)
	if err != nil {
		t.Fatal(err)
	}

	defer os.Remove(filename)
	defer f.Close()

	r := csv.NewReader(f)

	var actualTimeZones []TimeZone

	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		if err != nil {
			t.Fatal(err)
		}

		tz := TimeZone{
			Label:    record[0],
			Location: record[1],
		}

		actualTimeZones = append(actualTimeZones, tz)
	}

	if !reflect.DeepEqual(actualTimeZones, timeZones) {
		t.Fatalf("%v, want %v", actualTimeZones, timeZones)
	}
}

func TestRemoveTimeZone(t *testing.T) {
	chatID := 1

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

	AddTimeZones(chatID, timeZones)

	RemoveTimeZone(chatID, "Test 2")

	want := []TimeZone{
		{
			Label:    "Test 1",
			Location: "Test Location 1",
		},
		{
			Label:    "Test 3",
			Location: "Test Location 3",
		},
	}

	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	f, err := os.Open(filename)
	if err != nil {
		t.Fatal(err)
	}

	defer os.Remove(filename)
	defer f.Close()

	r := csv.NewReader(f)

	var got []TimeZone

	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		if err != nil {
			t.Fatal(err)
		}

		tz := TimeZone{
			Label:    record[0],
			Location: record[1],
		}

		got = append(got, tz)
	}

	if !reflect.DeepEqual(got, want) {
		t.Fatalf("%v, want %v", got, want)
	}
}

func TestRemoveTimeZones(t *testing.T) {
	chatID := 1

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

	AddTimeZones(chatID, timeZones)

	RemoveTimeZones(chatID)

	filename := fmt.Sprintf("timezones/%d.csv", chatID)

	if _, err := os.Stat(filename); !errors.Is(err, os.ErrNotExist) {
		t.Fatal(err)
	}
}
