#
# Copyright (c) 2020, ROE (http://www.roe.ac.uk/)
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

FROM atolmis/openssh-client:${buildtag}

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
# Install the Kubernetes client.
RUN dnf install -y kubernetes-client

#
# Install Helm.
# https://helm.sh/docs/intro/install/
# https://github.com/helm/helm/releases
ENV HELM_ARCH linux-amd64
ENV HELM_VERSION 3.8.1
ENV HELM_TARFILE helm-v${HELM_VERSION}-${HELM_ARCH}.tar.gz

ADD https://get.helm.sh/${HELM_TARFILE} /tmp/${HELM_TARFILE}
RUN tar --directory /tmp --gzip --extract --file /tmp/${HELM_TARFILE}
RUN mv  /tmp/${HELM_ARCH}/helm /usr/local/bin/helm

RUN rm -rf /tmp/${HELM_ARCH}
RUN rm -f  /tmp/${HELM_TARFILE}


