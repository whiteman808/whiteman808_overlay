# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

# Avoid the complexity of the "rake" recipe and run testrb-2 manually.
RUBY_FAKEGEM_RECIPE_TEST=none

inherit ruby-fakegem

DESCRIPTION="Provides a Ruby implementation of the XDG Base Directory Specification"
HOMEPAGE="https://github.com/bkuhlmann/xdg"

LICENSE="Hippocratic-2.1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/test-unit:2 )"

each_ruby_test() {
	ruby-ng_testrb-2 --pattern='test.*\.rb' test/
}
