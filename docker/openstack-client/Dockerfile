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

FROM atolmis/kubernetes-client:${buildtag}

# https://docs.docker.com/v17.09/engine/reference/builder/#understand-how-arg-and-from-interact
ARG buildtag
ARG buildtime

LABEL maintainer="Dave Morris <docker-admin@metagrid.co.uk>"
LABEL buildtag="${buildtag}"
LABEL buildtime="${buildtime}"
LABEL gitrepo="https://github.com/wfau/atolmis"

#
# Install the Openstack clients.
# https://docs.openstack.org/python-openstackclient/latest/
#RUN dnf install -y \
#    python3-heatclient \
#    python3-magnumclient \
#    python3-manilaclient \
#    python3-octaviaclient \
#    python3-openstackclient

# Apply our encoding fix.
# https://review.opendev.org/gitweb?p=openstack%2Fpython-magnumclient.git;a=commitdiff;h=3f7b994acd3eaac2321006b34cebfcb07d924934
#COPY encoding.patch /tmp
#RUN  patch -i /tmp/encoding.patch \
#     /usr/lib/python3.7/site-packages/magnumclient/common/utils.py

#
# Install PIP and GCC.
RUN dnf install -y \
    python3-devel \
    python3-pip \
    gcc

#
# Install the Openstack clients.
RUN pip3 install \
    python-heatclient \
    python-magnumclient \
    python-manilaclient \
    python-octaviaclient \
    python-openstackclient

#
# Add our util scripts.
COPY bin /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.sh

