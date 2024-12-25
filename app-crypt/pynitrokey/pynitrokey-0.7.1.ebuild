# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="A command line interface for the Nitrokey FIDO2, Start, 3 and NetHSM"
HOMEPAGE="https://github.com/Nitrokey/pynitrokey"

SRC_URI="https://github.com/Nitrokey/pynitrokey/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="piv"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/cffi[${PYTHON_USEDEP}]
	' 'python*')
	dev-python/cffi[${PYTHON_USEDEP}]
	=dev-python/click-8*[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.4[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	=dev-python/fido2-1*[${PYTHON_USEDEP}]
	dev-python/intelhex[${PYTHON_USEDEP}]
	>=dev-python/nitrokey-sdk-py-0.2.1[${PYTHON_USEDEP}]
	<dev-python/nitrokey-sdk-py-0.3[${PYTHON_USEDEP}]
	dev-python/nkdfu[${PYTHON_USEDEP}]
	dev-python/pyusb[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/tlv8[${PYTHON_USEDEP}]
	app-crypt/libnitrokey
	dev-python/click-aliases[${PYTHON_USEDEP}]
	dev-python/semver[${PYTHON_USEDEP}]
	>=dev-python/nethsm-1.2.1[${PYTHON_USEDEP}]
	<dev-python/nethsm-2[${PYTHON_USEDEP}]
	piv? ( dev-python/pyscard[${PYTHON_USEDEP}] )
"

# tests require a connected nitrokey device and will destroy the data on it!
# it would be bad if the user was not expecting this.
RESTRICT="test"

pkg_postinst(){
	elog "To use the 'piv' subcommand, enable USE 'piv'"
}
