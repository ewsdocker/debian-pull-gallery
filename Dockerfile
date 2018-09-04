# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for alpine-pull-gallery in an Alpine Linux container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 3.7.1
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/alpine-pull-gallery
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2017, 2018. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/alpine-pull-gallery.
#
#   ewsdocker/alpine-pull-gallery is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/alpine-pull-gallery is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/alpine-pull-gallery.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================
FROM nimmis/alpine-micro:3.7
MAINTAINER Jay Wheeler

ENV RIPME_VER 1.7.6

RUN set -xe \
    && apk add --no-cache ca-certificates \
			openjdk8-jre \
			wget \
    && mkdir /app \
    && wget "https://github.com/RipMeApp/ripme/releases/download/$RIPME_VER/ripme.jar" -P /app

VOLUME /data
WORKDIR /data

ENTRYPOINT ["java", "-jar", "/app/ripme.jar"]
CMD ["--help"]
