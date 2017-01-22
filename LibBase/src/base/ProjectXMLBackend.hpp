#ifndef CUTEHMI_LIBBASE_SRC_BASE_POJECTXMLBACKEND_HPP
#define CUTEHMI_LIBBASE_SRC_BASE_POJECTXMLBACKEND_HPP

#include "../platform.hpp"
#include "Error.hpp"
#include "PluginLoader.hpp"
#include "ProjectModel.hpp"

namespace cutehmi {
namespace base {

class XMLStreamReader;

class CUTEHMI_BASE_API ProjectXMLBackend
{
	public:
		struct CUTEHMI_BASE_API Error:
			public base::Error
		{
			enum : int {
				NOT_CUTEHMI_PROJECT_FILE = base::Error::SUBCLASS_BEGIN,
				UNSUPPORTED_VERSION,
				INVALID_FORMAT,
				PLUGIN_NOT_LOADED,
				PLUGIN_WRONG_INTERFACE,
				PLUGIN_PARSE_PROBLEM
			};

			using base::Error::Error;

			QString str() const;
		};

		/**
		 * Constructor.
		 * @param model project model.
		 * @param pluginLoader properly configured plugin loader.
		 */
		ProjectXMLBackend(ProjectModel * model, PluginLoader * pluginLoader);

		Error load(QIODevice & device);

//		void save(QIODevice * device);

	private:
		struct Loader0 {
			Loader0(QXmlStreamReader * xmlReader, ProjectModel::Node * root, PluginLoader * pluginLoader);

			Error parse(int versionMinor);

			Error plcClients();

			Error screens();

			private:
				QXmlStreamReader * m_xml;
				ProjectModel::Node * m_root;
				PluginLoader * m_pluginLoader;
		};

		struct Loader1
		{
			Loader1(XMLStreamReader * xmlReader, ProjectModel::Node * root, PluginLoader * pluginLoader);

			Error parse(int versionMinor);

			Error plugins();

			Error screens();

			private:
				XMLStreamReader * m_xml;
				ProjectModel::Node * m_root;
				PluginLoader * m_pluginLoader;
		};

//		struct Saver0 {
//		};

		ProjectModel * m_model;
		PluginLoader * m_pluginLoader;
		QXmlStreamReader m_xmlReader;
};

}
}

#endif

//(c)MP: Copyright © 2016, Michal Policht. All rights reserved.
//(c)MP: This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
