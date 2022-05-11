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

func TestHandleTimeCommandArgumentsEmpty(t *testing.T) {
	args := ""

	commandArgs, err := HandleTimeCommandArguments(args)
	if err != nil {
		t.Error(err)
	}

	if got := commandArgs.Format; got != Short {
		t.Errorf("got %v, want %v", got, Short)
	}
}

func TestHandleTimeCommandArgumentsMultiple(t *testing.T) {
	args := "short full unknown"

	if _, err := HandleTimeCommandArguments(args); err == nil {
		t.Errorf("want an error with args %q", args)
	}
}

func TestHandleTimeCommandArgumentsInvalid(t *testing.T) {
	args := "test"

	if _, err := HandleTimeCommandArguments(args); err == nil {
		t.Errorf("want an error with args %q", args)
	}
}
