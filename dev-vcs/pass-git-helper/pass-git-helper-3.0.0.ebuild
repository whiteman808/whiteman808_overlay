# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} python3_13t pypy3 )

inherit distutils-r1

DESCRIPTION="A git credential helper that allows using pass as the credential backend"
HOMEPAGE="https://github.com/languitar/pass-git-helper"

SRC_URI="https://github.com/languitar/pass-git-helper/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="app-admin/pass dev-python/pyxdg[${PYTHON_USEDEP}]"
BDEPEND="test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		${RDEPEND}
	)
"

python_test() {
	py.test -v || die
}
