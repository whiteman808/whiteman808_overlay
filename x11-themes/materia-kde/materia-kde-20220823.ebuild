# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="This is a port of the popular GTK theme Materia for the Plasma 5 desktop."
HOMEPAGE="https://github.com/PapirusDevelopmentTeam/materia-kde"
SRC_URI="https://github.com/PapirusDevelopmentTeam/materia-kde/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="x11-themes/kvantum
x11-themes/papirus-icon-theme"
