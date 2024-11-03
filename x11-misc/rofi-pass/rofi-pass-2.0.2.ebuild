# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A bash script to handle Simple Password Store in a convenient way using rofi"
HOMEPAGE="https://github.com/carnager/rofi-pass"
SRC_URI="https://github.com/carnager/rofi-pass/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

inherit optfeature

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="wayland"

DEPEND="
	!wayland? (
		x11-misc/rofi
	)
	wayland? (
		gui-apps/rofi-wayland
	)
"
RDEPEND="
	${DEPEND}
	!wayland? (
		x11-misc/xclip
		x11-misc/xdotool
	)
	wayland? (
		gui-apps/wl-clipboard
		gui-apps/wtype
	)
	app-admin/pwgen
"

src_compile() {
	true
}

src_install() {
	dobin rofi-pass addpass
	dodoc config.example README.md
	insinto /etc
	newins config.example rofi-pass.conf
}

pkg_postinst() {
	optfeature "OTPs" app-admin/pass-otp
}
