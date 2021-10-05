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

LABEL maintainer="Dave Morris <docker-admin@metagrid.co.uk>"
LABEL buildtag="${buildtag}"
LABEL buildtime="${buildtime}"
LABEL gitrepo="https://github.com/wfau/atolmis"

#
# Install the Terraform client.
# https://www.terraform.io/downloads.html
# https://github.com/RSE-Cambridge/iris-magnum/blob/master/magnum-tour/README.md
# https://computingforgeeks.com/how-to-install-terraform-on-fedora/

ENV TERRA_VERSION 1.0.5
ENV TERRA_ZIPFILE terraform_${TERRA_VERSION}_linux_amd64.zip

# Download the tar file
ADD https://releases.hashicorp.com/terraform/${TERRA_VERSION}/${TERRA_ZIPFILE} /tmp/${TERRA_ZIPFILE}

# Unpack the tar file.
RUN unzip -d /tmp /tmp/${TERRA_ZIPFILE}

# Install the binary.
RUN mv /tmp/terraform /usr/local/bin/terraform

