#!/bin/sh
#
# <meta:header>
#   <meta:licence>
#     Copyright (c) 2020, ROE (http://www.roe.ac.uk/)
#
#     This information is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This information is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
#   </meta:licence>
# </meta:header>
#
#zrq-notes-time
#zrq-notes-indent
#zrq-notes-crypto
#zrq-notes-ansible
#zrq-notes-osformat
#

# -----------------------------------------------------
# Build our containers.
#[user@desktop]

    buildtag=$(date '+%Y.%m.%d')
    buildtime=$(date '+%Y-%m-%dT%H:%M:%S')

    source "${HOME}/atolmis.env"
    pushd "${ATOLMIS_CODE:?}"

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/fedora:latest \
            --tag atolmis/fedora:${buildtag:?} \
            docker/fedora

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/openssh-client:latest \
            --tag atolmis/openssh-client:${buildtag:?} \
            docker/openssh-client

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/kubernetes-client:latest \
            --tag atolmis/kubernetes-client:${buildtag:?} \
            docker/kubernetes-client

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/openstack-client:latest \
            --tag atolmis/openstack-client:${buildtag:?} \
            docker/openstack-client

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/ansible-client:latest \
            --tag atolmis/ansible-client:${buildtag:?} \
            docker/ansible-client

        podman build \
            --build-arg "buildtag=${buildtag:?}" \
            --build-arg "buildtime=${buildtime:?}" \
            --tag atolmis/terraform-client:latest \
            --tag atolmis/terraform-client:${buildtag:?} \
            docker/terraform-client

    popd


