# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Python client for NitroKey NetHSM"
HOMEPAGE="https://github.com/Nitrokey/nethsm-sdk-py"
SRC_URI="https://github.com/Nitrokey/nethsm-sdk-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	=dev-python/typing-extensions-4*[${PYTHON_USEDEP}]
	=dev-python/urllib3-2*[${PYTHON_USEDEP}]
"

# tests require docker (provision a NetHSM instance in a container from a prebuilt image)
RESTRICT="test"
