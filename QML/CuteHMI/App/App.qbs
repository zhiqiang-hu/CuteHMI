import qbs

import cutehmi

cutehmi.QMLExtension {
	name: "CuteHMI.App"

	major: 1

	minor: 0

	micro: 0

	vendor: "CuteHMI"

	friendlyName: "Application QML"

	description: "Provides QML components for client applications."

	author: "Michal Policht"

	copyright: "Michal Policht"

	license: "Mozilla Public License, v. 2.0"

	files: [
        "designer/App.metainfo",
        "qmldir",
        "src/CuteHMIAppQMLPlugin.cpp",
        "src/CuteHMIAppQMLPlugin.hpp",
    ]

	//<workaround id="qbs-cutehmi-depends-1" target="Qbs" cause="design">
	Depends { name: "cutehmi_app_1" } cutehmi_app_1.reqMinor: 0
	//</workaround>
}

