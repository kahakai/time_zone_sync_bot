package main

import (
	"context"
	"fmt"
)

func PrepareDatabase() error {
	createTableStmt := `
	CREATE TABLE IF NOT EXISTS time_zones (
		id SERIAL PRIMARY KEY,
		chat_id BIGINT NOT NULL,
		label TEXT NOT NULL,
		location TEXT NOT NULL
	);`

	if _, err := dbConn.Exec(context.Background(), createTableStmt); err != nil {
		return fmt.Errorf("Error creating database table: %w", err)
	}

	return nil
}

func InsertTimeZone(chatID int64, timeZone TimeZone) error {
	insertStmt := "INSERT INTO time_zones(chat_id, label, location) VALUES($1, $2, $3)"

	_, err := dbConn.Exec(
		context.Background(),
		insertStmt,
		chatID,
		timeZone.Label,
		timeZone.Location,
	)
	if err != nil {
		return fmt.Errorf("Error inserting values: %w", err)
	}

	return nil
}

func SelectTimeZones(chatID int64) ([]TimeZone, error) {
	selectStmt := "SELECT label, location FROM time_zones WHERE chat_id = $1"

	rows, err := dbConn.Query(context.Background(), selectStmt, chatID)
	if err != nil {
		return []TimeZone{}, fmt.Errorf("Error selecting rows: %w", err)
	}
	defer rows.Close()

	var timeZones []TimeZone

	for rows.Next() {
		var label string
		var location string

		if err := rows.Scan(&label, &location); err != nil {
			return []TimeZone{}, fmt.Errorf("Error scanning row: %w", err)
		}

		tz := TimeZone{
			Label:    label,
			Location: location,
		}

		timeZones = append(timeZones, tz)
	}

	return timeZones, nil
}

func UpdateTimeZone(chatID int64, newTimeZone TimeZone) error {
	updateStmt := "UPDATE time_zones SET location = $3 WHERE chat_id = $1 AND label = $2"

	_, err := dbConn.Exec(
		context.Background(),
		updateStmt,
		chatID,
		newTimeZone.Label,
		newTimeZone.Location,
	)
	if err != nil {
		return fmt.Errorf("Error updating row: %w", err)
	}

	return nil
}

func DeleteTimeZone(chatID int64, label string) error {
	deleteStmt := "DELETE FROM time_zones WHERE chat_id = $1 AND label = $2"

	_, err := dbConn.Exec(context.Background(), deleteStmt, chatID, label)
	if err != nil {
		return fmt.Errorf("Error deleting row: %w", err)
	}

	return nil
}

func DeleteTimeZones(chatID int64) error {
	deleteStmt := "DELETE FROM time_zones WHERE chat_id = $1"

	_, err := dbConn.Exec(context.Background(), deleteStmt, chatID)
	if err != nil {
		return fmt.Errorf("Error deleting rows: %w", err)
	}

	return nil
}
