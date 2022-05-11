package main

import (
	"time"
)

type TimeFormat int64

const (
	Full TimeFormat = iota
	Short
)

func (f TimeFormat) String() string {
	switch f {
	case Full:
		return "full"
	case Short:
		return "short"
	}
	return "unknown"
}

func (f TimeFormat) Format() string {
	switch f {
	case Full:
		return time.RFC1123Z
	case Short:
		return "15:04 (-07)"
	}
	return "15:04"
}
