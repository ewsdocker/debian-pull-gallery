# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  RipMeApp/ripme in a Docker image..
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 9.6.2
# @copyright © 2018, 2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/debian-pull-gallery
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018, 2019. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/debian-pull-gallery.
#
#   ewsdocker/debian-pull-gallery is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/debian-pull-gallery is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/debian-pull-gallery.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

ARG ARG_VERSION="9.6.2"

ARG ARG_BASE_EXT="jre-8"
ARG ARG_BASE_VERS="9.6.0"

ARG ARG_RIPME_VER="1.7.78"
#ARG ARG_SOURCE="http://alpine-nginx-pkgcache/ripme-1.7.78.jar"

FROM ewsdocker/debian-openjre:${ARG_BASE_VERS}-${ARG_BASE_EXT}

MAINTAINER Jay Wheeler

# =========================================================================

# =========================================================================
#
#   Re-declare build args, but don't modify, to make external values internal
#
# =========================================================================

ARG ARG_SOURCE

ARG ARG_VERSION

ARG ARG_BASE_EXT
ARG ARG_BASE_VERS

ARG ARG_RIPME_VER

# =========================================================================

ENV RIPME_VER=${ARG_RIPME_VER:-"1.7.78"}

# =========================================================================

ENV LMS_HOME
ENV LMS_CONF
ENV LMS_BASE="/usr/local"

ENV LMSOPT_QUIET=0

# =========================================================================
#
#  Persist build args in LMSARG environment variables
#
# =========================================================================

ENV LMSARG_SOURCE=${ARG_SOURCE:-"https://github.com/RipMeApp/ripme/releases/download/$RIPME_VER/ripme.jar"}

ENV LMSARG_VERSION="${ARG_VERSION:-"0.1.2"}"
ENV LMSARG_VERS_EXT="${ARG_VERS_EXT}"

ENV LMSARG_GUI_VERS="${ARG_GUI_VERS:-9.6.3}"

# =========================================================================

ENV LMSBUILD_ICON="down.jpg"

ENV LMSBUILD_VERSION="${ARG_VERSION}"
ENV LMSBUILD_NAME=debian-pull-gallery 
ENV LMSBUILD_REPO=ewsdocker 
ENV LMSBUILD_REGISTRY="" 

ENV LMSBUILD_PARENT="debian-openjre:${ARG_BASE_VERS}-${ARG_BASE_EXT}"
ENV LMSBUILD_DOCKER="${LMSBUILD_REPO}/${LMSBUILD_NAME}:${LMSBUILD_VERSION}" 
ENV LMSBUILD_PACKAGE="${LMSBUILD_PARENT}, RipMeApp/ripme:${RIPME_VER}"

ENV LMSBUILD_FULLNAME="${LMSBUILD_NAME}"

# =========================================================================

ENV LMSBUILD_DESKTOP_NAME=Pull Gallery
ENV LMSBUILD_DESKTOP_CATEGORIES=Graphics

# =========================================================================

COPY scripts/. /

# =========================================================================

RUN \
 # =========================================================================
 #
 #    build the apt repo cache and install base support for Kaptain
 #
 # =========================================================================
    apt-get -y update \
 && apt-get -y upgrade \
 #
 # =========================================================================
 #
 #    download and install RipME
 #
 # =========================================================================
 #
 && mkdir -p /usr/share/ripme \
 && cd /usr/share/ripme \
 && wget "${LMSARG_SOURCE}" -o ripme.jar \
 #
 # =========================================================================
 #
 #   create a container version tag for FullName (with no tag for 'latest' version)
 #
 # =========================================================================
 #
# && if [ "${LMSBUILD_VERSION}" != "latest" ]; then LMSBUILD_FULLNAME+=":${LMSBUILD_VERSION}"; fi \
 #
 # =========================================================================
 #
 #   rename the template to the run script name and enable editing
 #
 # =========================================================================
 #
# && cd /usr/local/bin \
# && mv template ${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && chmod 775 ${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
 #
 # =========================================================================
 #
 #   customize the docker run command
 #
 # =========================================================================
 #
# && echo '           -v ${HOME}/.config/docker/'"${LMSBUILD_NAME}-${LMSBUILD_VERSION}:/root \\" >> /usr/local/bin/${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && echo '           -v ${HOME}/.config/docker/'"${LMSBUILD_NAME}-${LMSBUILD_VERSION}/workspace:/workspace \\" >> /usr/local/bin/${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && echo "           --name=${LMSBUILD_NAME}-${LMSBUILD_VERSION} \\" >> /usr/local/bin/${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && echo "       ${LMSBUILD_REPO}/${LMSBUILD_FULLNAME} " >> /usr/local/bin/${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && echo " " >> /usr/local/bin/${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
 #
 # =========================================================================
 # =========================================================================
 #
 # =========================================================================
 #
 #   rename the desktop script template to the desktop script name and enable editing
 #
 # =========================================================================
 #
# && cd /usr/local/share/applications \
# && mv desktop ${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
# && chmod 775 ${LMSBUILD_NAME}-${LMSBUILD_VERSION} \
 #
 # =========================================================================
 #
 #   customize the docker desktop application
 #
 # =========================================================================
 #
# && echo -n '-v ${HOME}/.config/docker/' >> ${LMSBUILD_NAME}-${LMSBUILD_VERSION}.desktop  \
# && echo "${LMSBUILD_NAME}-${LMSBUILD_VERSION}:/root --name=${LMSBUILD_NAME}-${LMSBUILD_VERSION} ${LMSBUILD_REPO}/${LMSBUILD_FULLNAME}" >> ${LMSBUILD_NAME}-${LMSBUILD_VERSION}.desktop \
 #
 # =========================================================================
 #
 #   create backup desktop application in ../lms folder
 #
 # =========================================================================
 #
 && mkdir -p ../lms && cp ${LMSBUILD_NAME}-${LMSBUILD_VERSION} ../lms \
 #
 # =========================================================================
 # =========================================================================
 #
 # =========================================================================
 #
 #   finish clean-up
 #
 # =========================================================================
 #
 && chmod 775 /usr/bin/ripme.sh \
 && chmod 775 /usr/share/ripme/ripme.jar \
 && chmod 775 /usr/local/bin/* \
# && chmod 600 /usr/local/share/applications/${LMSBUILD_NAME}-${LMSBUILD_VERSION}.desktop \
# && chmod 600 /usr/local/share/applications/${LMSBUILD_NAME}.desktop \
 && apt-get clean all  \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

VOLUME /batch
VOLUME /data

WORKDIR /data

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/bin/ripme.sh"]
