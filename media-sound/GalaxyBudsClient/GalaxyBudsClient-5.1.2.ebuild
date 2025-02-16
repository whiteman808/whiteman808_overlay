# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="8.0"
DOTNET_PKG_PROJECTS=( "${S}/GalaxyBudsClient.Platform.Linux" )
NUGET_APIS+=(
	"https://api.nuget.org/v3-flatcontainer"
	"https://nuget.org/api/v2"
	"https://nuget-feed-nightly.avaloniaui.net/v3"
)
NUGETS="
asyncerrorhandler.fody@1.3.0
avalonia.angle.windows.natives@2.1.22045.20230930
avalonia.buildservices@0.0.29
avalonia.controls.colorpicker@11.1.0-beta1
avalonia.controls.colorpicker@11.2.2
avalonia.controls.datagrid@11.2.2
avalonia.controls.itemsrepeater@11.0.0
avalonia.controls.itemsrepeater@11.1.0-beta1
avalonia.desktop@11.2.2
avalonia.diagnostics@11.2.2
avalonia.fonts.inter@11.2.2
avalonia.freedesktop@11.2.2
avalonia.markup.xaml.loader@11.2.2
avalonia.native@11.2.2
avalonia.reactiveui@11.2.2
avalonia.remote.protocol@11.1.0-beta1
avalonia.remote.protocol@11.2.2
avalonia.skia@11.0.2
avalonia.skia@11.1.0-beta1
avalonia.skia@11.2.0
avalonia.skia@11.2.2
avalonia.svg.skia@11.2.0.2
avalonia.themes.fluent@11.2.2
avalonia.themes.simple@11.2.2
avalonia.win32@11.2.2
avalonia.x11@11.2.2
avalonia.xaml.behaviors@11.2.0.1
avalonia.xaml.interactions.custom@11.2.0.1
avalonia.xaml.interactions.draganddrop@11.2.0.1
avalonia.xaml.interactions.draggable@11.2.0.1
avalonia.xaml.interactions.events@11.2.0.1
avalonia.xaml.interactions.responsive@11.2.0.1
avalonia.xaml.interactions@11.2.0.1
avalonia.xaml.interactivity@11.2.0.1
avalonia@11.2.2
avaloniahex@0.1.3
bouncycastle.cryptography@2.4.0
castle.core@5.0.0
commandlineparser@2.9.2-ci-210
config.net@5.2.0
cs-script@4.8.16
dynamicdata@8.3.27
dynamicdata@8.4.1
excss@4.2.3
fluentavalonia.breadcrumbbar@2.0.2
fluentavaloniaui@2.1.0-preview2
fluenticons.avalonia.fluent@1.1.234-exp
fluenticons.common@1.1.234
fody@6.0.0
fody@6.8.0
harfbuzzsharp.nativeassets.linux@2.8.2.3
harfbuzzsharp.nativeassets.linux@7.3.0
harfbuzzsharp.nativeassets.linux@7.3.0.2
harfbuzzsharp.nativeassets.linux@7.3.0.3
harfbuzzsharp.nativeassets.macos@2.8.2.3
harfbuzzsharp.nativeassets.macos@7.3.0
harfbuzzsharp.nativeassets.macos@7.3.0.2
harfbuzzsharp.nativeassets.macos@7.3.0.3
harfbuzzsharp.nativeassets.webassembly@2.8.2.3
harfbuzzsharp.nativeassets.webassembly@7.3.0
harfbuzzsharp.nativeassets.webassembly@7.3.0.3
harfbuzzsharp.nativeassets.webassembly@7.3.0.3-preview.2.2
harfbuzzsharp.nativeassets.win32@2.8.2.3
harfbuzzsharp.nativeassets.win32@7.3.0
harfbuzzsharp.nativeassets.win32@7.3.0.2
harfbuzzsharp.nativeassets.win32@7.3.0.3
harfbuzzsharp@2.8.2.3
harfbuzzsharp@7.3.0
harfbuzzsharp@7.3.0.2
harfbuzzsharp@7.3.0.3
humanizer.core@2.14.1
microcom.runtime@0.11.0
microsoft.aspnet.webapi.client@6.0.0
microsoft.bcl.asyncinterfaces@7.0.0
microsoft.codeanalysis.analyzers@3.3.4
microsoft.codeanalysis.common@4.8.0
microsoft.codeanalysis.csharp.scripting@4.8.0
microsoft.codeanalysis.csharp.workspaces@4.8.0
microsoft.codeanalysis.csharp@4.8.0
microsoft.codeanalysis.scripting.common@4.8.0
microsoft.codeanalysis.workspaces.common@4.8.0
microsoft.csharp@4.7.0
microsoft.data.sqlite.core@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.abstractions@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.analyzers@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.design@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.relational@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.sqlite.core@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore.sqlite@9.0.0-preview.3.24172.4
microsoft.entityframeworkcore@9.0.0-preview.3.24172.4
microsoft.extensions.caching.abstractions@9.0.0-preview.3.24172.9
microsoft.extensions.caching.memory@9.0.0-preview.3.24172.9
microsoft.extensions.configuration.abstractions@9.0.0-preview.3.24172.9
microsoft.extensions.dependencyinjection.abstractions@9.0.0-preview.3.24172.9
microsoft.extensions.dependencyinjection@9.0.0-preview.3.24172.9
microsoft.extensions.dependencymodel@8.0.0
microsoft.extensions.dependencymodel@9.0.0-preview.3.24172.9
microsoft.extensions.logging.abstractions@9.0.0-preview.3.24172.9
microsoft.extensions.logging@9.0.0-preview.3.24172.9
microsoft.extensions.options@9.0.0-preview.3.24172.9
microsoft.extensions.primitives@9.0.0-preview.3.24172.9
microsoft.netcore.platforms@1.1.0
microsoft.netcore.platforms@5.0.0
microsoft.netcore.targets@1.1.0
microsoft.win32.primitives@4.3.0
microsoft.win32.registry@5.0.0
microsoft.win32.systemevents@6.0.0
mono.texttemplating@3.0.0-preview-0052-g5d0f76c785
netstandard.library@1.6.1
netstandard.library@2.0.3
newtonsoft.json.bson@1.0.2
newtonsoft.json@13.0.1
reactiveui.fody@19.5.41
reactiveui@19.5.41
reactiveui@20.1.1
runtime.any.system.collections@4.3.0
runtime.any.system.diagnostics.tools@4.3.0
runtime.any.system.diagnostics.tracing@4.3.0
runtime.any.system.globalization.calendars@4.3.0
runtime.any.system.globalization@4.3.0
runtime.any.system.io@4.3.0
runtime.any.system.reflection.extensions@4.3.0
runtime.any.system.reflection.primitives@4.3.0
runtime.any.system.reflection@4.3.0
runtime.any.system.resources.resourcemanager@4.3.0
runtime.any.system.runtime.handles@4.3.0
runtime.any.system.runtime.interopservices@4.3.0
runtime.any.system.runtime@4.3.0
runtime.any.system.text.encoding.extensions@4.3.0
runtime.any.system.text.encoding@4.3.0
runtime.any.system.threading.tasks@4.3.0
runtime.any.system.threading.timer@4.3.0
runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.native.system.io.compression@4.3.0
runtime.native.system.net.http@4.3.0
runtime.native.system.security.cryptography.apple@4.3.0
runtime.native.system.security.cryptography.openssl@4.3.0
runtime.native.system@4.3.0
runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.apple@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.unix.microsoft.win32.primitives@4.3.0
runtime.unix.system.console@4.3.0
runtime.unix.system.diagnostics.debug@4.3.0
runtime.unix.system.io.filesystem@4.3.0
runtime.unix.system.net.primitives@4.3.0
runtime.unix.system.net.sockets@4.3.0
runtime.unix.system.private.uri@4.3.0
runtime.unix.system.runtime.extensions@4.3.0
scottplot.avalonia@5.0.37
scottplot@5.0.37
sentry.serilog@4.2.1
sentry@4.2.1
serilog.sinks.console@5.0.1
serilog.sinks.debug@2.0.0
serilog.sinks.file@5.0.0
serilog.sinks.trace@3.0.0
serilog@3.1.1
sharphook@5.3.7
shimskiasharp@2.0.0.4
skiasharp.harfbuzz@2.88.8
skiasharp.nativeassets.linux.nodependencies@2.88.8
skiasharp.nativeassets.linux@2.88.3
skiasharp.nativeassets.linux@2.88.7
skiasharp.nativeassets.linux@2.88.8
skiasharp.nativeassets.linux@2.88.9
skiasharp.nativeassets.macos@2.88.3
skiasharp.nativeassets.macos@2.88.7
skiasharp.nativeassets.macos@2.88.8
skiasharp.nativeassets.macos@2.88.9
skiasharp.nativeassets.webassembly@2.88.3
skiasharp.nativeassets.webassembly@2.88.7
skiasharp.nativeassets.webassembly@2.88.8
skiasharp.nativeassets.webassembly@2.88.9
skiasharp.nativeassets.win32@2.88.3
skiasharp.nativeassets.win32@2.88.7
skiasharp.nativeassets.win32@2.88.8
skiasharp.nativeassets.win32@2.88.9
skiasharp@2.88.3
skiasharp@2.88.7
skiasharp@2.88.8
skiasharp@2.88.9
splat@14.8.12
splat@15.1.1
sqlitepclraw.bundle_e_sqlite3@2.1.7
sqlitepclraw.core@2.1.7
sqlitepclraw.lib.e_sqlite3@2.1.7
sqlitepclraw.provider.e_sqlite3@2.1.7
svg.custom@2.0.0.4
svg.model@2.0.0.4
svg.skia@2.0.0.4
system.appcontext@4.3.0
system.buffers@4.3.0
system.buffers@4.5.1
system.codedom@6.0.0
system.collections.concurrent@4.3.0
system.collections.immutable@7.0.0
system.collections@4.3.0
system.componentmodel.annotations@5.0.0
system.composition.attributedmodel@7.0.0
system.composition.convention@7.0.0
system.composition.hosting@7.0.0
system.composition.runtime@7.0.0
system.composition.typedparts@7.0.0
system.composition@7.0.0
system.configuration.configurationmanager@6.0.0
system.console@4.3.0
system.diagnostics.debug@4.3.0
system.diagnostics.diagnosticsource@4.3.0
system.diagnostics.eventlog@6.0.0
system.diagnostics.tools@4.3.0
system.diagnostics.tracing@4.3.0
system.drawing.common@6.0.0
system.globalization.calendars@4.3.0
system.globalization.extensions@4.3.0
system.globalization@4.3.0
system.io.compression.zipfile@4.3.0
system.io.compression@4.3.0
system.io.filesystem.primitives@4.3.0
system.io.filesystem@4.3.0
system.io.pipelines@6.0.0
system.io.pipelines@7.0.0
system.io.pipelines@8.0.0
system.io@4.3.0
system.linq.expressions@4.3.0
system.linq@4.3.0
system.memory@4.5.3
system.memory@4.5.5
system.net.http@4.3.0
system.net.nameresolution@4.3.0
system.net.primitives@4.3.0
system.net.sockets@4.3.0
system.numerics.vectors@4.4.0
system.objectmodel@4.3.0
system.private.uri@4.3.0
system.reactive@6.0.0
system.reactive@6.0.1
system.reflection.emit.ilgeneration@4.3.0
system.reflection.emit.lightweight@4.3.0
system.reflection.emit@4.3.0
system.reflection.extensions@4.3.0
system.reflection.metadata@7.0.0
system.reflection.primitives@4.3.0
system.reflection.typeextensions@4.3.0
system.reflection@4.3.0
system.resources.resourcemanager@4.3.0
system.runtime.compilerservices.unsafe@4.5.3
system.runtime.compilerservices.unsafe@6.0.0
system.runtime.extensions@4.3.0
system.runtime.handles@4.3.0
system.runtime.interopservices.runtimeinformation@4.3.0
system.runtime.interopservices@4.3.0
system.runtime.loader@4.3.0
system.runtime.numerics@4.3.0
system.runtime@4.3.0
system.security.accesscontrol@5.0.0
system.security.accesscontrol@6.0.0
system.security.claims@4.3.0
system.security.cryptography.algorithms@4.3.0
system.security.cryptography.cng@4.3.0
system.security.cryptography.csp@4.3.0
system.security.cryptography.encoding@4.3.0
system.security.cryptography.openssl@4.3.0
system.security.cryptography.primitives@4.3.0
system.security.cryptography.protecteddata@6.0.0
system.security.cryptography.x509certificates@4.3.0
system.security.permissions@6.0.0
system.security.principal.windows@4.3.0
system.security.principal.windows@5.0.0
system.security.principal@4.3.0
system.text.encoding.codepages@7.0.0
system.text.encoding.codepages@8.0.0
system.text.encoding.extensions@4.3.0
system.text.encoding@4.3.0
system.text.encodings.web@8.0.0
system.text.encodings.web@9.0.0-preview.3.24172.9
system.text.json@8.0.0
system.text.json@9.0.0-preview.3.24172.9
system.text.regularexpressions@4.3.0
system.threading.channels@7.0.0
system.threading.tasks.extensions@4.3.0
system.threading.tasks.extensions@4.5.4
system.threading.tasks@4.3.0
system.threading.threadpool@4.3.0
system.threading.timer@4.3.0
system.threading@4.3.0
system.windows.extensions@6.0.0
system.xml.readerwriter@4.3.0
system.xml.xdocument@4.3.0
tmds.dbus.protocol@0.16.0
tmds.dbus.protocol@0.20.0
tmds.dbus@0.16.0
"
inherit dotnet-pkg desktop

DESCRIPTION="An unofficial manager for Galaxy Buds devices"
HOMEPAGE="https://github.com/timschneeb/GalaxyBudsClient"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/timschneeb/GalaxyBudsClient.git"
else
	SRC_URI="https://github.com/timschneeb/GalaxyBudsClient/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
fi

SRC_URI+=" ${NUGET_URIS} "

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-wireless/bluez"
RDEPEND="${DEPEND}"

# Detect architecture
if [ $ARCH == "amd64" ]; then
	DOTNETARCH="linux-x64"
elif [ $ARCH == "arm" ]; then
	DOTNETARCH="linux-arm"
elif [ $ARCH == "arm64" ]; then
	DOTNETARCH="linux-arm64"
fi

src_unpack() {
	dotnet-pkg_src_unpack

	if [[ -n ${EGIT_REPO_URI} ]]; then
		git-r3_src_unpack
	fi
}

src_prepare() {
	dotnet-pkg_src_prepare
}

src_configure() {
	local -r dotnet_args=(
		"--runtime ${DOTNETARCH}"
		"--source ${T}/nugets"
		"--configfile ${S}/GalaxyBudsClient/nuget.config"
	)
	dotnet-pkg-base_restore_tools
	edotnet restore ${dotnet_args[*]} "${S}/GalaxyBudsClient/GalaxyBudsClient.csproj"
}

src_compile() {
	local -r dotnet_args=(
		"-r ${DOTNETARCH}"
		"-o ${S}/bin"
		"-c Release"
		"-p:PublishSingleFile=true"
		"--self-contained true"
		"--no-restore"
	)
	edotnet publish ${dotnet_args[*]} "${S}/GalaxyBudsClient/GalaxyBudsClient.csproj"
}

src_install() {
	dobin bin/GalaxyBudsClient
	newicon "${S}/GalaxyBudsClient/Resources/icon.png" "GalaxyBudsClient.png"
	make_desktop_entry ${PN}
}
