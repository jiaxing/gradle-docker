FROM java:8

ARG GRADLE_VERSION=3.0
ARG GRADLE_URL=https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
ARG GRADLE_SHA256=39c906941a474444afbddc38144ed44166825acb0a57b0551dddb04bbf157f80

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
CMD ["gradle", "--version"]
