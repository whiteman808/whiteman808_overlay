# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop systemd optfeature

DESCRIPTION="A search provider for GNOME Shell that adds support for search in pass"
HOMEPAGE="https://github.com/jle64/gnome-pass-search-provider"
SRC_URI="https://github.com/jle64/gnome-pass-search-provider/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"
RDEPEND="
|| (
	app-admin/pass
	app-admin/gopass
	app-admin/rbw
)
gnome-base/gnome
dev-python/thefuzz
"

src_install() {
	# The actual executable
	exeinto /usr/lib/gnome-pass-search-provider
	doexe gnome-pass-search-provider.py

	# Search provider definition
	insinto /usr/share/gnome-shell/search-providers
	doins conf/org.gnome.Pass.SearchProvider.ini

	# Desktop file (for having an icon)
	domenu conf/org.gnome.Pass.SearchProvider.desktop

	# DBus configuration (no-systemd)
	insinto /usr/share/dbus-1/services
	newins conf/org.gnome.Pass.SearchProvider.service.dbus org.gnome.Pass.SearchProvider.service

	# DBus configuration (systemd)
	systemd_newuserunit conf/org.gnome.Pass.SearchProvider.service.systemd org.gnome.Pass.SearchProvider.service
}

pkg_postinst() {
	optfeature "GPaste clipboard manager support" x11-misc/gpaste
	optfeature "pass-otp extension support" app-admin/pass-otp
}
