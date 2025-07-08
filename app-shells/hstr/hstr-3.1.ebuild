# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools toolchain-funcs

DESCRIPTION="Shell history suggest box"
HOMEPAGE="https://github.com/dvorka/hstr http://www.mindforger.com"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dvorka/hstr.git"
	S="${WORKDIR}/hstr-${PV}"
else
	SRC_URI="https://github.com/dvorka/hstr/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm64"
	S="${WORKDIR}/hstr-${PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	sys-libs/ncurses:=[unicode(+)]"

DEPEND="
	${RDEPEND}"

BDEPEND="virtual/pkgconfig"

DOCS=( CONFIGURATION.md README.md )

PATCHES=(
	"${FILESDIR}"/${PN}-2.0-fix-ncurses-configure.patch
)

src_prepare() {
	default

	sed \
		-e 's:-O2::g' \
		-i src/Makefile.am || die

	tc-export PKG_CONFIG

	eautoreconf
}
