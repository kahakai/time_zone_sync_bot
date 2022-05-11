# TimeZoneSyncBot
[`@TimeZoneSyncBot`](https://t.me/TimeZoneSyncBot) — a bot for storing time zones to sync them in a chat.

- Deployed on Heroku
- Uses Postgres for storage

## Features
- Add time zone
- Remove times zone
- Clear time zones
- Show time with time zones

## Commands
- `/add_timezone <label> <time_zone>`: Add time zone with a label. Time zone must be specified as TZ database name.
- `/remove_timezone <label>`: Remove time zone with the label.
- `/clear_timezones`: Remove all time zones.
- `/time`: Show time with time zones. Available formats: `full`, `short`
- `/help`: Show help message.

## Examples
`/time` or `/time short`
```plaintext
Warsaw: 12:36 (+02)
Wrocław: 12:36 (+02)
Haifa: 13:36 (+03)
San_Francisco: 03:36 (-07)
Tbilisi: 14:36 (+04)
```

`/time full`
```plaintext
Mon, 02 Jan 2006 15:04:05 -0700

Warsaw: Sun, 01 May 2022 12:36:49 +0200
Wrocław: Sun, 01 May 2022 12:36:49 +0200
Haifa: Sun, 01 May 2022 13:36:49 +0300
San_Francisco: Sun, 01 May 2022 03:36:49 -0700
Tbilisi: Sun, 01 May 2022 14:36:49 +0400
```
