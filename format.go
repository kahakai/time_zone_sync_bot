package main

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
		return "Mon Jan _2 15:04:05 2006"
	case Short:
		return "15:04"
	}
	return "15:04"
}
