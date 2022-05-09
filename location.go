package main

import (
	"time"
)

func GetLocation(name string) (*time.Location, error) {
	location, err := time.LoadLocation(name)
	if err != nil {
		return nil, err
	}

	return location, nil
}
