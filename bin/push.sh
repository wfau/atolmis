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

    secret 'ghcr.io.pass' \
    | podman login \
        --password-stdin \
        --username "$(secret 'ghcr.io.user')" \
        'ghcr.io'


# -----------------------------------------------------
# Push our images to the GitHub repository.

    pushtag()
        {
        local reponame=${1:?}
        local imagename=${2:?}
        local imagetag=${3:?}
        podman tag \
            "${imagename:?}:${imagetag:?}" \
            "${reponame:?}/${imagename:?}:${imagetag:?}"
        podman push \
            "${reponame:?}/${imagename:?}:${imagetag:?}"
        }

    pushtags()
        {
        local reponame=${1:?}
        local imagename=${2:?}
        local imagetag=${3:?}
        pushtag "${reponame:?}" "${imagename:?}" "latest"
        pushtag "${reponame:?}" "${imagename:?}" "${imagetag:?}"
        }

    pushtags "ghcr.io/wfau" "atolmis/fedora" "latest"
    pushtags "ghcr.io/wfau" "atolmis/fedora" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/openssh-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/openssh-client" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/kubernetes-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/kubernetes-client" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/openstack-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/openstack-client" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/ansible-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/ansible-client" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/digitalocean-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/digitalocean-client" "${buildtag:?}"

    pushtags "ghcr.io/wfau" "atolmis/terraform-client" "latest"
    pushtags "ghcr.io/wfau" "atolmis/terraform-client" "${buildtag:?}"


