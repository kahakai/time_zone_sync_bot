package main

import (
	"reflect"
	"testing"
)

func TestHandleAddTimeZoneCommandArgumentsInvalid(t *testing.T) {
	args := ""

	if _, err := HandleAddTimeZoneCommandArguments(args); err == nil {
		t.Errorf("want an error with args %q", args)
	}
}

func TestHandleAddTimeZoneCommandArgumentsInvalidLocation(t *testing.T) {
	args := "Test InvalidLocation"

	if _, err := HandleAddTimeZoneCommandArguments(args); err == nil {
		t.Errorf("want an error with args %q", args)
	}
}

func TestHandleAddTimeZoneCommandArguments(t *testing.T) {
	want := AddTimeZoneArguments{
		Label:    "Test",
		Location: "Europe/London",
	}

	args := "Test Europe/London"

	got, err := HandleAddTimeZoneCommandArguments(args)
	if err != nil {
		t.Error(err)
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v, want %v", got, want)
	}
}

func TestHandleRemoveTimeZoneCommandArgumentsInvalid(t *testing.T) {
	args := ""

	if _, err := HandleRemoveTimeZoneCommandArguments(args); err == nil {
		t.Errorf("want an error with args %q", args)
	}
}

func TestHandleRemoveTimeZoneCommandArguments(t *testing.T) {
	want := RemoveTimeZoneArguments{
		Label: "Test",
	}

	args := "Test"

	got, err := HandleRemoveTimeZoneCommandArguments(args)
	if err != nil {
		t.Error(err)
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v, want %v", got, want)
	}
}
