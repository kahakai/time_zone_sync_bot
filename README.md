# TimeZoneSyncBot
[`@TimeZoneSyncBot`](https://t.me/TimeZoneSyncBot) — a bot for syncing time between time zones in a chat.

## Installation
1. Deploy to [Fly.io](https://fly.io/).
2. Add `APP_NAME` secret.
3. Add `BOT_TOKEN` secret.
4. Add optional `BOT_MAX_CONCURRENCY` secret (default value is `1000`).
5. Add optional `PORT` secret (default value is `4000`).
6. Add `DATABASE_URL` secret (default value is `localhost/time_zone_sync_bot` for development and tests).

## Features
- Add time zone.
- Update time zone.
- Remove times zone.
- Remove all time zones.
- Show time in time zones.
- Show date in time zones.
- Show time zones.
- Show help message.

## Commands
- `/add_time_zone <label> <time_zone>`: Add time zone with a label. Time zone must be specified as TZ database name.
- `/update_time_zone <label> <new_time_zone>`: Update time zone with the label.
- `/remove_time_zone <label>`: Remove time zone with the label.
- `/clear_time_zones`: Remove all time zones.
- `/time`: Show time in time zones.
- `/date`: Show date in time zones.
- `/time_zones`: Show time zones.
- `/help`: Show help message.

## Examples
`/time`
```plaintext
<b>Tbilisi</b>: 11:20 (+0400)
<b>Haifa</b>: 10:20 (+0300)
<b>Warsaw</b>: 09:20 (+0200)
<b>London</b>: 08:20 (+0100)
<b>San_Francisco</b>: 00:20 (-0700)
```

`/date`
```plaintext
<b>Tbilisi</b>: 2023-04-09
<b>Haifa</b>: 2023-04-09
<b>Warsaw</b>: 2023-04-09
<b>London</b>: 2023-04-09
<b>San_Francisco</b>: 2023-04-09
```

`/timezones`
```plaintext
<b>Tbilisi</b>: Asia/Tbilisi
<b>Haifa</b>: Asia/Jerusalem
<b>Warsaw</b>: Europe/Warsaw
<b>London</b>: Europe/London
<b>San_Francisco</b>: America/Los_Angeles
```

