# =========================================================================
# =========================================================================
#
#	desktopTemplate
#	   Script for minimal application desktop configuration for 
#         gui containers from template
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2019. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/lms-utilities
# @subpackage desktopTemplate
#
# =========================================================================
#
#	Copyright © 2019. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/lms-utilities.
#
#   ewsdocker/lms-utilities is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/lms-utilities is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/lms-utilities.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

LMSBUILD_FULLNAME="${LMSBUILD_NAME}"
[[ "${LMSBUILD_VERSION}" != "latest" ]] && LMSBUILD_FULLNAME+=":${LMSBUILD_VERSION}"

# =========================================================================

read -d '' desktopEntry << DESKTOP
[Desktop Entry]
Encoding=UTF-8
Type=Application
Terminal=false
StartupNotify=false
Categories=${LMSBUILD_DESKTOP_CATEGORIES}
GenericName=${LMSBUILD_DESKTOP_NAME} ${LMSBUILD_VERSION}
Name=${LMSBUILD_DESKTOP_NAME} ${LMSBUILD_VERSION}
Icon=${LMS_BASE}/share/icons/${LMSBUILD_ICON}
Exec=${LMS_BASE}/bin/docker-deb-start ${LMSBUILD_FULLNAME}
DESKTOP
