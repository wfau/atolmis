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

# FROM fedora:32
# https://github.com/docker-library/repo-info/blob/master/repos/fedora/tag-details.md#fedora32
FROM fedora@sha256:e69b5a62ce23c673885bddc94e6679c9b2af683059637ceddb9cff458537a326

# https://docs.docker.com/v17.09/engine/reference/builder/#understand-how-arg-and-from-interact
ARG buildtag
ARG buildtime

LABEL maintainer="Dave Morris <docker-admin@metagrid.co.uk>"
LABEL buildtag="${buildtag}"
LABEL buildtime="${buildtime}"
LABEL gitrepo="https://github.com/wfau/atolmis"

#
# Mount the YUM cache as a volume.
VOLUME /var/cache/dnf
VOLUME /var/cache/yum

#
# Install common admin tools.
RUN dnf install -y \
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
# Install the ipcalc tools.
# http://jodies.de/ipcalc
RUN dnf install -y ipcalc

#
# Set the terminal type for exec.
# https://github.com/docker/docker/issues/9299
# Looks like this is fixed in Fedora-30
#ENV TERM xterm

#
# Add our install scripts.
COPY bin /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.sh

#
# Run our install scripts.
RUN /usr/local/bin/install-locale.sh

