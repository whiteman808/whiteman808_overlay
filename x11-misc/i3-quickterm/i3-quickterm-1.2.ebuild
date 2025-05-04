# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="A small drop-down terminal for i3wm and sway"
HOMEPAGE="
	https://github.com/lbonn/i3-quickterm/
	https://pypi.org/project/i3-quickterm/
"
SRC_URI="https://github.com/lbonn/i3-quickterm/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	|| (
		>=x11-wm/i3-3.11
		>=gui-wm/sway-1.2
	)
	>=dev-python/i3ipc-2.0.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
