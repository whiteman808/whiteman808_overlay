# Copyright 2021 Aisha Tammy
# Distributed under the terms of the ISC License

EAPI=8

DESCRIPTION="colorful_loop theme for plymouth"
HOMEPAGE="https://github.com/adi1090x/plymouth-themes"

inherit git-r3
EGIT_REPO_URI="https://github.com/adi1090x/plymouth-themes"

LICENSE="GPL-3"
SLOT="0"

src_install() {
	insinto /usr/share/plymouth/themes
	doins -r pack_1/colorful_loop
}
