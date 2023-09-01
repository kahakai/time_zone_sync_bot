defmodule TimeZoneSyncBot.Bot do
  use Telegram.Bot

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "pinned_message" => _
          }
        },
        _token
      ) do
    :noop
  end

  @impl Telegram.Bot
  def handle_update(
        %{
          "message" => %{
            "text" => "/add_time_zone" <> args,
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/update_time_zone" <> args,
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/remove_time_zone" <> args,
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/clear_time_zones",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/time",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/date",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/time_zones",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
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
            "text" => "/help",
            "chat" => %{
              "id" => chat_id
            },
            "message_id" => message_id
          }
        },
        token
      ) do
    TimeZoneSyncBot.Handlers.HelpCommand.handle(token, chat_id, message_id)
  end

  @impl Telegram.Bot
  def handle_update(update, token) do
    TimeZoneSyncBot.Handlers.UnknownCommand.handle(token, update)
  end
end
