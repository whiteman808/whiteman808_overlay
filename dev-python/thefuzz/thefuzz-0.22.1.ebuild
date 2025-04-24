# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

DESCRIPTION="Fuzzy String Matching in Python."
HOMEPAGE="https://github.com/rhinstaller/dasbus"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/seatgeek/thefuzz.git"
else
	SRC_URI="https://github.com/seatgeek/thefuzz/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-python/rapidfuzz"
DEPEND="
	test? (
		$(python_gen_cond_dep "
			dev-python/hypothesis[${PYTHON_USEDEP}]
		")
	)
	${RDEPEND}
"

distutils_enable_tests pytest
