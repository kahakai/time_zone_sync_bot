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
- `/add_timezone <label> <time_zone>`: Add time zone with a label.
- `/remove_timezone <label>`: Remove time zone with the label.
- `/clear_timezones`: Remove all time zones.
- `/time`: Show time with time zones.
- `/help`: Show help message.

## Examples
`/time`
```plaintext
Warsaw: Europe/Warsaw Sun May  1 12:36:49 2022
Wrocław: Europe/Warsaw Sun May  1 12:36:49 2022
Haifa: Asia/Tel_Aviv Sun May  1 13:36:49 2022
San_Francisco: America/Los_Angeles Sun May  1 03:36:49 2022
Tbilisi: Asia/Tbilisi Sun May  1 14:36:49 2022
```
