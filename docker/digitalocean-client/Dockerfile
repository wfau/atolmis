#
# Copyright (c) 2021, ROE (http://www.roe.ac.uk/)
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

FROM atolmis/kubernetes-client:${buildtag}

# https://docs.docker.com/v17.09/engine/reference/builder/#understand-how-arg-and-from-interact
ARG buildtag
ARG buildtime

LABEL maintainer="Dave Morris <docker-admin@metagrid.co.uk>"
LABEL buildtag="${buildtag}"
LABEL buildtime="${buildtime}"
LABEL gitrepo="https://github.com/wfau/atolmis"

#
# Install the DigitalOcean client.
# https://github.com/digitalocean/doctl/releases
ENV DOCTL_ARCH linux-amd64
ENV DOCTL_VERSION 1.64.0
ENV DOCTL_TARFILE doctl-${DOCTL_VERSION}-${DOCTL_ARCH}.tar.gz
ENV DOCTL_DOWNLOAD https://github.com/digitalocean/doctl/releases/download

ADD ${DOCTL_DOWNLOAD}/v${DOCTL_VERSION}/${DOCTL_TARFILE} /tmp/${DOCTL_TARFILE}
RUN tar --directory /tmp --gzip --extract --file /tmp/${DOCTL_TARFILE}
RUN mv  /tmp/doctl /usr/local/bin/doctl







