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

    secret "ghcr.io.pass" \
    | podman login \
        --username "$(secret ghcr.io.user)" \
        "ghcr.io"


# -----------------------------------------------------
# Push our images to the GitHub repository.

    pushtag()
        {
        local imagerepo=${1:?}
        local imagename=${2:?}
        local imagetag=${3:?}
        podman tag \
            "${imagename:?}:${imagetag:?}" \
            "${imagerepo:?}/${imagename:?}:${imagetag:?}"
        podman push \
            "${imagerepo:?}/${imagename:?}:${imagetag:?}"
        }

    pushtags()
        {
        local imagerepo=${1:?}
        local imagename=${2:?}
        local imagetag=${3:?}
        tagpush "${imagerepo:?}" "${imagename:?}" "latest"
        tagpush "${imagerepo:?}" "${imagename:?}" "${buildtag:?}"
        }

    tagpush "ghcr.io" "atolmis/fedora" "latest"
    tagpush "ghcr.io" "atolmis/fedora" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/openssh-client" "latest"
    tagpush "ghcr.io" "atolmis/openssh-client" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/kubernetes-client" "latest"
    tagpush "ghcr.io" "atolmis/kubernetes-client" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/openstack-client" "latest"
    tagpush "ghcr.io" "atolmis/openstack-client" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/ansible-client" "latest"
    tagpush "ghcr.io" "atolmis/ansible-client" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/digitalocean-client" "latest"
    tagpush "ghcr.io" "atolmis/digitalocean-client" "${buildtag:?}"

    tagpush "ghcr.io" "atolmis/terraform-client" "latest"
    tagpush "ghcr.io" "atolmis/terraform-client" "${buildtag:?}"


