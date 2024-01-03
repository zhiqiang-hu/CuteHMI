import qbs
import qbs.TextFile
import qbs.Environment

Module {
	property string initClassName: product.cutehmi.conventions.functions.initClassName(product.name)

	property string initHeader: product.cutehmi.conventions.functions.initHeader(product.name)

	PropertyOptions {
		name: "artifacts"
		description: "Whether to generate any artifacts."
	}
	property bool artifacts: true

	property path initCppArtifact: artifacts ? "cutehmi.init.cpp" : undefined

	Depends { name: "cutehmi.conventions" }

	Rule {
		condition: initCppArtifact !== undefined
		multiplex: true

		prepare: {
			var cppCmd = new JavaScriptCommand();
			cppCmd.description = "generating " + output.filePath
			cppCmd.highlight = "codegen";
			cppCmd.sourceCode = function() {
				var f = new TextFile(output.filePath, TextFile.WriteOnly);
				try {
					var prefix = "CUTEHMI_INIT"

					f.writeLine("#ifndef " + prefix + "_HPP")
					f.writeLine("#define " + prefix + "_HPP")

					f.writeLine("")
					f.writeLine("// This file has been autogenerated by 'cutehmi.init' Qbs module.")
					f.writeLine("")

					if (!product.cutehmi.init.initHeader) {
						console.error("Value of 'cutehmi.init.initHeader' property has not been defined by product '" + product.name + "'!")
						f.writeLine("// Value of 'cutehmi.init.initHeader' property has not been defined by product '" + product.name + "'!")
					} else
						f.writeLine("#include \"" + product.cutehmi.init.initHeader + "\" // Specified by 'cutehmi.init.initHeader'.")

					f.writeLine("")

					if (!product.cutehmi.init.initClassName) {
						console.error("Value of 'cutehmi.init.initClassName' property has not been defined by product '" + product.name + "'!")
						f.writeLine("// Value of 'cutehmi.init.initClassName' property has not been defined by product '" + product.name + "'!")
					} else {
						f.writeLine("namespace {")
						f.writeLine("	" + product.cutehmi.init.initClassName + " init; // Specified by 'cutehmi.init.initClassName'.")
						f.writeLine("}")
					}

					f.writeLine("")
					f.writeLine("#endif")
				} finally {
					f.close()
				}
			}

			return [cppCmd]
		}

		Artifact {
			filePath: product.cutehmi.init.initCppArtifact
			fileTags: ["cpp"]
		}
	}
}

//(c)C: Copyright © 2019-2023, Michał Policht <michal@policht.pl>. All rights reserved.
//(c)C: SPDX-License-Identifier: LGPL-3.0-or-later OR MIT
//(c)C: This file is a part of CuteHMI.
//(c)C: CuteHMI is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//(c)C: CuteHMI is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
//(c)C: You should have received a copy of the GNU Lesser General Public License along with CuteHMI.  If not, see <https://www.gnu.org/licenses/>.
//(c)C: Additionally, this file is licensed under terms of MIT license as expressed below.
//(c)C: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//(c)C: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//(c)C: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
