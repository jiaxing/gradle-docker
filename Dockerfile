FROM java:8

RUN apt-get clean && apt-get update \
  && apt-get install -y --no-install-recommends bash \
  && rm -rf /var/lib/apt/lists/*

ARG GRADLE_VERSION=2.13
ARG GRADLE_URL=https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
ARG GRADLE_SHA256=0f665ec6a5a67865faf7ba0d825afb19c26705ea0597cec80dd191b0f2cbb664

ADD $GRADLE_URL /usr/bin/gradle.zip

WORKDIR /usr/bin
RUN echo "$GRADLE_SHA256  gradle.zip" | sha256sum -c - && \
 unzip gradle.zip && \
 rm gradle.zip && \
 ln -s gradle-${GRADLE_VERSION} gradle

ENV GRADLE_HOME /usr/bin/gradle
ENV GRADLE_USER_HOME /cache/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

VOLUME ["/app", $GRADLE_USER_HOME]

WORKDIR /app
ENTRYPOINT ["gradle"]
CMD ["--version"]
