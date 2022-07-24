#
# Copyright (c) 2019, ROE (http://www.roe.ac.uk/)
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

# FROM fedora:36
FROM registry.fedoraproject.org/fedora:36

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

#
# Mount the YUM cache as a volume.
VOLUME /var/cache/dnf
VOLUME /var/cache/yum

#
# Install common admin tools.
RUN dnf install -y \
    dateutils \
    diffutils \
    findutils \
    gnupg \
    gzip  \
    less  \
    nano  \
    patch \
    pwgen \
    sed   \
    tar   \
    wget  \
    which \
    zip

#
# Install system monitoring tools.
RUN dnf install -y \
    procps-ng

#
# Install the jq JSON parser.
# https://stedolan.github.io/jq/
RUN dnf install -y jq

#
# Install YAML lint.
RUN dnf install -y yamllint

#
# Install yq YAML parser.
RUN wget -O   '/usr/bin/yq' 'https://github.com/mikefarah/yq/releases/download/v4.26.1/yq_linux_amd64'
RUN chmod a+x '/usr/bin/yq'

#
# Install the ipcalc tools.
# http://jodies.de/ipcalc
RUN dnf install -y ipcalc

#
# Install the bind-utils.
# https://github.com/wfau/atolmis/issues/17
RUN dnf install -y bind-utils

#
# Install the S3 client
RUN dnf install -y s3cmd

#
# Install git
# https://github.com/wfau/atolmis/issues/22
RUN dnf install -y git

#
# Add our install scripts.
COPY bin /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.sh

#
# Run our install scripts.
RUN /usr/local/bin/install-locale.sh

