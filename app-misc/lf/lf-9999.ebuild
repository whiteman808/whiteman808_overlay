# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module shell-completion desktop xdg

DESCRIPTION="Terminal file manager"
HOMEPAGE="https://github.com/gokcehan/lf"

LICENSE="MIT"
SLOT="0"

if [[ "${PV}" = 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gokcehan/lf.git"
else
	SRC_URI="https://github.com/gokcehan/lf/archive/r${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" https://codeberg.org/whiteman808/gentoo-distfiles/raw/branch/main/app-misc/lf/lf-35-vendor.tar.xz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"

	S="${WORKDIR}/${PN}-r${PV}"
fi

IUSE="+static"

src_unpack() {
	if [[ ${PV} = 9999* ]]; then
		git-r3_src_unpack
		git-r3_checkout
		go-module_live_vendor
	else
		go-module_src_unpack
	fi
}

src_compile() {
	local ldflags="-s -w -X main.gVersion=r${PV}"
	use static && {
		export CGO_ENABLED=0
		ldflags+=' -extldflags "-static"'
	}

	ego build -ldflags="${ldflags}"
}

src_install() {
	local DOCS=( README.md etc/lfrc.example )

	dobin "${PN}"

	einstalldocs

	doman "${PN}.1"

	# bash & zsh cd script
	insinto "/usr/share/${PN}"
	doins "etc/${PN}cd.sh"

	# bash-completion
	newbashcomp "etc/${PN}.bash" "${PN}"

	# zsh-completion
	newzshcomp "etc/${PN}.zsh" "_${PN}"

	# fish-completion
	dofishcomp "etc/${PN}.fish"
	dofishcomp "etc/${PN}cd.fish"

	domenu "${PN}.desktop"
}
