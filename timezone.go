package main

type TimeZone struct {
	Label string
	Location string
}

func (tz TimeZone) Values() []string {
	return []string{
		tz.Label,
		tz.Location,
	}
}
