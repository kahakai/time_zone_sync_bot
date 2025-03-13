defmodule TimeZoneSyncBot.Bot do
  use Telegram.Bot

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/add_time_zone" <> args
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.AddTimeZoneCommand.handle(token, chat_id, message_id, args)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/update_time_zone" <> args
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.UpdateTimeZoneCommand.handle(token, chat_id, message_id, args)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/remove_time_zone" <> args
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.RemoveTimeZoneCommand.handle(token, chat_id, message_id, args)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/clear_time_zones"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.ClearTimeZonesCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/date"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.DateCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/time"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.TimeCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/datetime"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.DateTimeCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/sync_datetime" <> args
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.SyncDateTimeCommand.handle(token, chat_id, message_id, args)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/time_zones"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.TimeZonesCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/help"
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.HelpCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id,
            "text" => "/" <> _
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.UnknownCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(update, token) do
    TimeZoneSyncBot.Handlers.UnknownMessage.handle(token, update)
  end
end
