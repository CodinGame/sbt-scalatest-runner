FROM bouga/scala-sbt:2.12

COPY build.sh      /project/build
COPY entrypoint.sh /

RUN chmod +x /project/build entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
