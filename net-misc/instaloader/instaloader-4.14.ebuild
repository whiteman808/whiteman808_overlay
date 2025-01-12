# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Download pictures (or videos) from Instagram."
HOMEPAGE="https://instaloader.github.io/"
SRC_URI="https://github.com/instaloader/instaloader/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="browser-cookie3"
BDEPEND="
	>=dev-python/requests-2.25[${PYTHON_USEDEP}]
	browser-cookie3? ( >=dev-python/browser-cookie3-0.19.1[${PYTHON_USEDEP}] )
"
RDEPEND="${BDEPEND}"
