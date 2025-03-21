# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 edo go-module

DESCRIPTION="Simple bookmarks manager written in the Go language."
HOMEPAGE="https://github.com/go-shiori/shiori"
SRC_URI="https://github.com/go-shiori/shiori/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://git.paraboletancza.org/whiteman808/gentoo-distfiles/raw/branch/main/${CATEGORY}/${PN}/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	ego build

	local shell
	for shell in bash fish zsh; do
		edo ./shiori completion ${shell} > shiori.${shell}
	done
}

src_install() {
	einstalldocs

	dobin shiori

	newbashcomp "${PN}".bash "${PN}"

	insinto /usr/share/fish/vendor_completions.d
	doins shiori.fish

	insinto /usr/share/zsh/site-functions
	newins shiori.zsh _shiori
}
