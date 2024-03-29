#
# Copyright (c) 2018, ROE (http://www.roe.ac.uk/)
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

ARG buildtag

FROM atolmis/java:${buildtag}

# https://docs.docker.com/v17.09/engine/reference/builder/#understand-how-arg-and-from-interact
ARG buildtag
ARG buildtime

LABEL maintainer "Dave Morris <docker-admin@metagrid.co.uk>"
LABEL buildtag   "${buildtag}"
LABEL buildtime  "${buildtime}"
LABEL vendor     "Wide Field Astronomy Unit (WFAU)"
LABEL version    "${buildtag}"
LABEL license    "GPL-3.0-or-later"
LABEL org.opencontainers.image.created  "${buildtime}"
LABEL org.opencontainers.image.vendor   "Wide Field Astronomy Unit (WFAU)"
LABEL org.opencontainers.image.version  "${buildtag}"
LABEL org.opencontainers.image.licenses "GPL-3.0-or-later"
LABEL org.opencontainers.image.source   "https://github.com/wfau/atolmis"
LABEL org.opencontainers.image.authors  "https://github.com/Zarquan"

ENV KAFKA_VERSION 3.1.0
ENV SCALA_VERSION 2.13
ENV FULL_VERSION  ${SCALA_VERSION}-${KAFKA_VERSION}

ENV KAFKA_DIRNAME kafka_${FULL_VERSION}
ENV KAFKA_TARFILE kafka_${FULL_VERSION}.tgz

#
# Set our download directory.
WORKDIR /tmp

#
# Download the tar file
ADD http://www-eu.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_TARFILE}       /tmp/${KAFKA_TARFILE}
ADD http://www-eu.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_TARFILE}.md5   /tmp/${KAFKA_TARFILE}.md5

#
# Check the checksum.
#RUN md5sum -c "${KAFKA_TARFILE}.md5"

#
# Unpack the tar file.
RUN tar -zxf ${KAFKA_TARFILE} -C /var/local
RUN rm ${KAFKA_TARFILE}
RUN rm ${KAFKA_TARFILE}.md5

#
# Link the unpacked directory
WORKDIR /var/local
RUN ln -sf ${KAFKA_DIRNAME} kafka

#
# Make this the working directory
WORKDIR /var/local/kafka

