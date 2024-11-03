# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

# Avoid the complexity of the "rake" recipe and run testrb-2 manually.
RUBY_FAKEGEM_RECIPE_TEST=none

inherit ruby-fakegem

DESCRIPTION="Create and manage tmux sessions easily"
HOMEPAGE="https://github.com/tmuxinator/tmuxinator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

PATCHES=(
	"${FILESDIR}/xdg.patch"
)

ruby_add_rdepend "
	>=dev-ruby/erubi-1.7
	>=dev-ruby/thor-1.3.0
	>=dev-ruby/xdg-2.2.5
"
ruby_add_bdepend "test? ( dev-ruby/test-unit:2 )"

each_ruby_test() {
	ruby-ng_testrb-2 --pattern='test.*\.rb' test/
}
