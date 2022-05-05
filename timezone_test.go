package main

import (
	"testing"
	"reflect"
)

func TestValues(t *testing.T) {
	tz := TimeZone{
		Label: "Test",
		Location: "Test Location",
	}

	want := []string{
		"Test",
		"Test Location",
	}

	values := tz.Values()

	if !reflect.DeepEqual(values, want) {
		t.Fatalf("%v, want %v", values, want)
	}
}
