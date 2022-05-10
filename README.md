# TimeZoneSyncBot
[`@TimeZoneSyncBot`](https://t.me/TimeZoneSyncBot) — a bot for storing time zones to sync them in a chat.

## Features
- Add time zone
- Remove times zone(s)
- Clear time zones
- Show time with time zones

## Commands
- `add_timezone`
- `remove_timezone`
- `remove_timezones`
- `clear_timezones`
- `time`
- `help`

## Caveats
- Data is stored as **plain text** in CSV files.
- One CSV file for one chat, they are matched with `chat_id`.

## [Sequence diagram](https://sequencediagram.org/index.html?presentationMode=readOnly#initialData=C4S2BsFMAIBUQLYwMoE8B2BjaAhA9sAFCEAOAhgE6iYjnrDQCqAzpBaZdbWfdAMIALMkXJUQNOg3wjO47r2m4ymANaR0AE2Is2AWgB8g4QC4A9KCTEjwA9OMBJdADc8awtdsFjAUQAekTABXYBgLGEw8BAQeLUJlUCdhGGlCaU8pZTVNYwAFCjxMSGZmaDDoCKiYgB10HMoyJBCKZmMa6HKhYAB9EFj4kESQ3AIlVXUtRRxM8fTRrI1jADEQTWgAMxAodbwKDuEeiZGpsc0AHl1dSens5a21nb3u3uIrk41Z4-mfX2AKeNLEDAAF54dBFdb5BClAQwDZQVJHa4ac6XRFvYzwJDQEFg5gvNHzD5I4x8MjgILgJLlQIUCjqBhhBEZN4o15fTEwFYArE4or45mE-Rs8ZLHbRBmA6Bcsq8vHCs4XeULRZi4QhDTcyD81kEkUqiji9WawgaSD9QbJXWaKydHXAYwAWSKzDIAHMYAB3MACbYGtWQDWM03mqkpQg6Cgo6zGZACPAe41AA)

## Examples
`/time`
```plaintext
Warsaw: Europe/Warsaw Sun May  1 12:36:49 2022
Wrocław: Europe/Warsaw Sun May  1 12:36:49 2022
Haifa: Asia/Tel_Aviv Sun May  1 13:36:49 2022
San_Francisco: America/Los_Angeles Sun May  1 03:36:49 2022
Tbilisi: Asia/Tbilisi Sun May  1 14:36:49 2022
```
