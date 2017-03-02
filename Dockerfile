FROM bouga/scala-sbt:2.11

COPY build.sh      /project/build
COPY entrypoint.sh /

RUN chmod +x /project/build entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
