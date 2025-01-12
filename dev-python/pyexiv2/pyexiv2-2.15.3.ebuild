# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} python3_13t )
inherit distutils-r1

DESCRIPTION="Read and write image metadata, including EXIF, IPTC, XMP, ICC Profile."
HOMEPAGE="https://github.com/LeoHsiao1/pyexiv2"
SRC_URI="https://github.com/LeoHsiao1/pyexiv2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-python/pytest[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
