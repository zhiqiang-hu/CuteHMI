import qbs

import cutehmi

Project {
	name: "CuteHMI.Symbols.HVAC.0"

	cutehmi.Extension {
		name: parent.name

		friendlyName: "HVAC"

		vendor: "CuteHMI"

		domain: "cutehmi.kde.org"

		description: "Symbols for heating, ventilation and air conditioning."

		files: [
         "AirFilter.qml",
         "BasicCooler.qml",
         "BasicDiscreteInstrument.qml",
         "BasicHeater.qml",
         "BladeDamper.qml",
         "CentrifugalFan.qml",
         "Cooler.qml",
         "HeatExchanger.qml",
         "HeatRecoveryWheel.qml",
         "Heater.qml",
         "LICENSE",
         "MotorActuator.qml",
         "Pump.qml",
         "README.md",
         "SymbolCanvas.qml",
         "Tank.qml",
         "Valve.qml",
         "designer/HVAC.metainfo",
     ]

		Depends { name: "CuteHMI.2" }

		Depends { name: "cutehmi.doxygen" }
		cutehmi.doxygen.warnIfUndocumented: false
		cutehmi.doxygen.useDoxyqml: true
		cutehmi.doxygen.exclude: ['dev', 'tests']

		Depends { name: "cutehmi.qmldir" }
		cutehmi.qmldir.exclude: ["^SymbolCanvas.qml$"]

		Depends { name: "cutehmi.qmltypes" }

		Export {
			Depends { name: "CuteHMI.2" }
		}
	}
}

//(c)C: Copyright © 2020, Michał Policht <michal@policht.pl>. All rights reserved.
//(c)C: This file is a part of CuteHMI.
//(c)C: CuteHMI is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//(c)C: CuteHMI is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
//(c)C: You should have received a copy of the GNU Lesser General Public License along with CuteHMI.  If not, see <https://www.gnu.org/licenses/>.