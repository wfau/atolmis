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
#

# -----------------------------------------------------
# Set the build date.
#[user@desktop]

    buildtag=$(date '+%Y.%m.%d')

# -----------------------------------------------------
# Check our secret function works.
#[user@desktop]

    secret frog

# -----------------------------------------------------
# Login to the Docker registry.
#[user@desktop]

    podman login \
        --username $(secret docker.io.user) \
        --password $(secret docker.io.pass) \
        registry-1.docker.io

    #
    # New behaviour - podman needs the registry name here.
    #

# -----------------------------------------------------
# Push our images to Docker hub.
#[user@desktop]

    podman push "atolmis/fedora:${buildtag:?}"
    podman push "atolmis/fedora:latest"

    podman push "atolmis/openssh-client:${buildtag:?}"
    podman push "atolmis/openssh-client:latest"

    podman push "atolmis/kubernetes-client:${buildtag:?}"
    podman push "atolmis/kubernetes-client:latest"

    podman push "atolmis/openstack-client:${buildtag:?}"
    podman push "atolmis/openstack-client:latest"

    podman push "atolmis/ansible-client:${buildtag:?}"
    podman push "atolmis/ansible-client:latest"

    podman push "atolmis/terraform-client:${buildtag:?}"
    podman push "atolmis/terraform-client:latest"


