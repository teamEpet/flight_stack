ACLOCAL_AMFLAGS = -I m4 --install

lib_LTLIBRARIES = libfastcdr.la
libfastcdr_la_SOURCES =  Cdr.cpp FastCdr.cpp FastBuffer.cpp exceptions/Exception.cpp exceptions/NotEnoughMemoryException.cpp exceptions/BadParamException.cpp FastCdr.rc
libfastcdr_la_LDFLAGS = -version-number 1:0:7

AM_CPPFLAGS = -DFASTCDR_SOURCE -I../../include
