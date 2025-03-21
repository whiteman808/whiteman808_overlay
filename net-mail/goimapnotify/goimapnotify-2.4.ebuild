# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Execute scripts on IMAP mailbox changes using IDLE, golang version."
HOMEPAGE="https://gitlab.com/shackra/goimapnotify"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/shackra/goimapnotify.git"
else
	SRC_URI="https://gitlab.com/shackra/goimapnotify/-/archive/${PV}/${P}.tar.gz"
	SRC_URI+=" https://git.paraboletancza.org/whiteman808/gentoo-distfiles/raw/branch/main/${CATEGORY}/${PN}/${P}-deps.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3+"
SLOT="0"

IUSE="systemd"
RESTRICT="test strip"
DEPEND="dev-lang/go"
BDEPEND="${DEPEND}"
RDEPEND="systemd? ( sys-apps/systemd )"

src_unpack() {
	if [[ ${PV} == 9999* ]]; then
		git-r3_src_unpack
		git-r3_checkout
		go-module_live_vendor
	else
		go-module_src_unpack
	fi
}

src_compile() {
	ego build
}

src_install() {
	dobin "${PN}"
	systemd_douserunit "${FILESDIR}"/goimapnotify.service
}
