# Copyright 2016 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SUBDIRS = include src/cpp

fastrtps_licenciasdir = $(datadir)/doc/fastrtps
fastrtps_licencias_DATA = LICENSE

fastrtps_scriptdir = $(bindir)
fastrtps_script_SCRIPTS = .bin/fastrtpsgen

fastrtps_javadir = $(datadir)/fastrtps
fastrtps_java_DATA = share/fastrtps/fastrtpsgen.jar

install-data-hook:
	mkdir -p $(DESTDIR)$(datadir)/doc/fastrtps; \
	cp -r share/doc/* $(DESTDIR)$(datadir)/doc/fastrtps; \
	mkdir -p $(DESTDIR)$(datadir)/fastrtps; \
	cp -r examples $(DESTDIR)$(datadir)/fastrtps/;

uninstall-hook:
	rm -r $(DESTDIR)$(datadir)/doc/fastrtps; \
	rm -r $(DESTDIR)$(datadir)/fastrtps
	rm -r $(DESTDIR)$(includedir)/fastrtps
