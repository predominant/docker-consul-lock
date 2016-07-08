FROM consul:v0.6.4

MAINTAINER Graham Weldon <graham@grahamweldon.com> (@predominant)

COPY docker-entrypoint-crashy.sh /usr/local/bin/docker-entrypoint-crashy.sh
COPY crashy.sh /usr/local/bin/crashy.sh
ENTRYPOINT ["docker-entrypoint-crashy.sh"]
