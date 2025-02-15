ARG BUILDER_IMAGE="hexpm/elixir:1.18.2-erlang-27.2.2-alpine-3.21.2"
ARG RUNNER_IMAGE="alpine:3.21.3"

FROM ${BUILDER_IMAGE} as builder

RUN apk update \
    && apk add --no-cache build-base \
                          git

WORKDIR /app

RUN mix local.hex --force \
    && mix local.rebar --force

ENV MIX_ENV="prod"

COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

COPY priv priv

COPY lib lib

RUN mix compile

COPY config/runtime.exs config/

RUN mix release

FROM ${RUNNER_IMAGE}

RUN apk update \
    && apk add --no-cache libstdc++ \
                          ncurses-libs

WORKDIR /app
RUN chown nobody /app

COPY --from=builder --chown=nobody:root /app/_build/prod/rel ./

USER nobody

RUN set -eux; \
    ln -nfs /app/$(basename *)/bin/$(basename *) /app/entry

ENV ECTO_IPV6=true
ENV ERL_AFLAGS="-proto_dist inet6_tcp"

CMD /app/entry start
