# gradler-docker

Dockerfiles for the [`jaysong/gradle`](https://hub.docker.com/r/jaysong/gradle/) Docker
Hub images which contains Java and Gradle.

## Feature:

- [java:8](https://hub.docker.com/r/library/java/)
- Gradle 2.13
- `GRADLE_USER_HOME` is set at `/cache/gradle`.
- `GRADLE_HOME` is set at `/usr/bin/gradle`.
- A mount point is created at `/app` and `/GRADLE_USER_HOME` respectively.
- The working directory is set to `/app`.

## How-To:
Assuming the [Gradle Java starter project](https://spring.io/guides/gs/gradle/) in the
working directory, one can run the `build` target by
```
docker run --rm -v $(pwd):/app jaysong/gradle:8-2.13 gradle build
```

One can also mount a host directory to the `GRADLE_USER_HOME` volume so as avoid
downloading the same dependency multiple times across builds.
```
docker run --rm -v $(pwd):/app -v /tmp/gradle-cache:/cache/gradle jaysong/gradle:8-2.13 gradle build
```
