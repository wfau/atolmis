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

FROM atolmis/openstack-client:${buildtag}

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
# Install the Terraform client.
# https://www.terraform.io/downloads.html
# https://github.com/RSE-Cambridge/iris-magnum/blob/master/magnum-tour/README.md
# https://computingforgeeks.com/how-to-install-terraform-on-fedora/

ENV TERRA_VERSION 1.1.7
ENV TERRA_ZIPFILE terraform_${TERRA_VERSION}_linux_amd64.zip

# Download and install the zip file
ADD https://releases.hashicorp.com/terraform/${TERRA_VERSION}/${TERRA_ZIPFILE} /tmp/${TERRA_ZIPFILE}
RUN unzip -d /tmp /tmp/${TERRA_ZIPFILE}
RUN mv /tmp/terraform /usr/local/bin/terraform
RUN rm /tmp/${TERRA_ZIPFILE}

