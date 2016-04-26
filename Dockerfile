FROM java:8

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
ENV GRADLE_USER_HOME /cache/.gradle
ENV PATH $PATH:$GRADLE_HOME/bin

VOLUME /app

WORKDIR /app
ENTRYPOINT ["gradle"]
CMD ["--version"]
