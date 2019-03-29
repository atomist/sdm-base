# FROM gcr.io/kaniko-project/executor:v0.9.0 AS kaniko

FROM ubuntu:18.04

LABEL maintainer="Atomist <docker@atomist.com>"

RUN apt-get update && apt-get install -y \
        dumb-init \
    && rm -rf /var/lib/apt/lists/*

ENV BLUEBIRD_WARNINGS 0
ENV NODE_ENV production
ENV NODE_OPTIONS --no-deprecation
ENV NPM_CONFIG_LOGLEVEL warn
ENV SUPPRESS_NO_CONFIG_WARNING true

RUN groupadd --gid 2866 atomist \
    && useradd --home-dir /home/atomist --create-home --uid 2866 --gid 2866 --shell /bin/sh --skel /dev/null atomist

RUN mkdir -p /opt

# kaniko hijacks /opt
RUN mkdir -p /sdm

WORKDIR /sdm

EXPOSE 2866

ENTRYPOINT ["dumb-init", "node", "--trace-warnings", "--expose_gc", "--optimize_for_size", "--always_compact", "--max_old_space_size=384"]

CMD ["/sdm/node_modules/.bin/atm-start"]

RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        wget \
        git \
        docker.io \
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global user.email "bot@atomist.com" \
    && git config --global user.name "Atomist Bot"

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# COPY --from=kaniko /kaniko /kaniko

# declare /sdm as volume so kaniko ignores it
# VOLUME ["/sdm"]
