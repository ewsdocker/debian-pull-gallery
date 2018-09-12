# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for debian-pull-gallery in an Debian container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 9.5.2
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/debian-pull-gallery
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
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
FROM ewsdocker/debian-openjre:8-jre-9.5.4
MAINTAINER Jay Wheeler

# =========================================================================

ENV RIPME_VER 1.7.64

# =========================================================================

ENV LMSBUILD_VERSION="9.5.2"
ENV LMSBUILD_NAME=debian-pull-gallery 
ENV LMSBUILD_REPO=ewsdocker 
ENV LMSBUILD_REGISTRY="" 

ENV LMSBUILD_PARENT="debian-openjre:8-jre-9.5.4"
ENV LMSBUILD_DOCKER="${LMSBUILD_REPO}/${LMSBUILD_NAME}:${LMSBUILD_VERSION}" 
ENV LMSBUILD_PACKAGE="${LMSBUILD_PARENT}, RipMeApp/ripme:${RIPME_VER}"

# =========================================================================

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install \
            libgtk-3-0 \
            libgtk-3-bin \
            libgtk-3-common \ 
 && mkdir -p /usr/share/ripme \
 && cd /usr/share/ripme \
 && wget "https://github.com/RipMeApp/ripme/releases/download/$RIPME_VER/ripme.jar" \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt  

# =========================================================================

COPY scripts/. /

RUN chmod 775 /usr/bin/ripme.bash \
 && chmod 775 /usr/share/ripme/ripme.jar \
 && chmod 775 /usr/local/bin/* \
 && chmod 600 /usr/local/share/applications/${LMSBUILD_NAME}-${LMSBUILD_VERSION}.desktop 

# =========================================================================

VOLUME /batch
VOLUME /data

WORKDIR /data

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/bin/ripme.bash"]
