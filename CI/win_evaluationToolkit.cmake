# LICENSE:
# Copyright (c) 2015, CERN and Universidad de Oviedo
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS 
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Author: Damian Abalo Miron <damian.abalo@cern.ch>

message("using build configuration from win_evaluationToolkit.cmake")


#-------
#Boost
#-------
SET( BOOST_PATH_HEADERS "C:/Libraries/boost_1_58_0" )
SET( BOOST_PATH_LIBS "C:/Libraries/boost_1_58_0/lib64-msvc-12.0"	 )
message(STATUS "BOOST - include [${BOOST_PATH_HEADERS}] libs [${BOOST_PATH_LIBS}]")

if(NOT TARGET libboostprogramoptions)
	add_library(libboostprogramoptions STATIC IMPORTED)
	set_property(TARGET libboostprogramoptions PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_program_options-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostsystem)
	add_library(libboostsystem STATIC IMPORTED)
	set_property(TARGET libboostsystem PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_system-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostfilesystem)
	add_library(libboostfilesystem STATIC IMPORTED)
	set_property(TARGET libboostfilesystem PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_filesystem-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostchrono) 
	add_library(libboostchrono STATIC IMPORTED)
	set_property(TARGET libboostchrono PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_chrono-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostdatetime) 
	add_library(libboostdatetime STATIC IMPORTED)
	set_property(TARGET libboostdatetime PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_date_time-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostthread) 
	add_library(libboostthread STATIC IMPORTED)
	set_property(TARGET libboostthread PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_thread-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostlog)
	add_library(libboostlog STATIC IMPORTED)
	set_property(TARGET libboostlog PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_log-vc120-mt-1_58.lib)
endif()
if(NOT TARGET libboostlogsetup)
	add_library(libboostlogsetup STATIC IMPORTED)
	set_property(TARGET libboostlogsetup PROPERTY IMPORTED_LOCATION ${BOOST_PATH_LIBS}/libboost_log_setup-vc120-mt-1_58.lib)
endif()

set( BOOST_LIBS  libboostlogsetup libboostlog libboostsystem libboostfilesystem libboostthread libboostprogramoptions libboostchrono libboostdatetime -lrt)

#------
#OPCUA
#------
SET( OPCUA_TOOLKIT_PATH "C:\Program Files (x86)\UnifiedAutomation\UaSdkCppBundleEval" )

message(STATUS "UA TOOLKIT - OPC-UA toolkit path [${OPCUA_TOOLKIT_PATH}]" )

if(NOT TARGET libuamodule)
	add_library(libuamodule STATIC IMPORTED)
	set_property(TARGET libuamodule PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uamodule.lib)
endif()
if(NOT TARGET libcoremodule)
	add_library(libcoremodule STATIC IMPORTED)
	set_property(TARGET libcoremodule PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/coremodule.lib)
endif()
if(NOT TARGET libuabase)
	add_library(libuabase STATIC IMPORTED)
	set_property(TARGET libuabase PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uabase.lib)
endif()
if(NOT TARGET libuastack)
	add_library(libuastack STATIC IMPORTED)
	set_property(TARGET libuastack PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uastack.lib)
endif()
if(NOT TARGET libuapki)
	add_library(libuapki STATIC IMPORTED)
	set_property(TARGET libuapki PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uapki.lib)
endif()
if(NOT TARGET libxmlparser)
	add_library(libxmlparser STATIC IMPORTED)
	set_property(TARGET libxmlparser PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/xmlparser.lib)
endif()

if(NOT TARGET libuamoduled)
	add_library(libuamoduled STATIC IMPORTED)
	set_property(TARGET libuamoduled PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uamoduled.lib)
endif()
if(NOT TARGET libcoremoduled)
	add_library(libcoremoduled STATIC IMPORTED)
	set_property(TARGET libcoremoduled PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/coremoduled.lib)
endif()
if(NOT TARGET libuabased)
	add_library(libuabased STATIC IMPORTED)
	set_property(TARGET libuabased PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uabased.lib)
endif()
if(NOT TARGET libuastackd)
	add_library(libuastackd STATIC IMPORTED)
	set_property(TARGET libuastackd PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uastackd.lib)
endif()
if(NOT TARGET libuapkid)
	add_library(libuapkid STATIC IMPORTED)
	set_property(TARGET libuapkid PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/uapkid.lib)
endif()
if(NOT TARGET libxmlparserd)
	add_library(libxmlparserd STATIC IMPORTED)
	set_property(TARGET libxmlparserd PROPERTY IMPORTED_LOCATION ${OPCUA_TOOLKIT_PATH}/lib/xmlparserd.lib)
endif()

SET( OPCUA_TOOLKIT_LIBS_DEBUG libuamoduled libcoremoduled libuabased libuastackd libuapkid libxmlparserd ) 
SET( OPCUA_TOOLKIT_LIBS_RELEASE libuamodule libcoremodule libuabase libuastack libuapki libxmlparser )

#-----
# LogIt
#-----
SET( LOGIT_HAS_STDOUTLOG TRUE )
SET( LOGIT_HAS_BOOSTLOG FALSE )
SET( LOGIT_HAS_UATRACE FALSE )
MESSAGE( STATUS "LogIt build options: stdout [${LOGIT_HAS_STDOUTLOG}] boost [${LOGIT_HAS_BOOSTLOG}] uaTrace [${LOGIT_HAS_UATRACE}]" )

#-----
#CodeSynthesys XSD
#-----
include_directories(
"C:/Program Files (x86)/CodeSynthesis XSD 3.3/include"
)
		

#----
#OPENSSL
#----
SET(OPENSSL_PATH "C:/OpenSSL-Win32")

include_directories(
	${OPENSSL_PATH}/include
)
message(STATUS "Open SSL path [${OPENSSL_PATH}]" )

#----
#XERCESC
#----
SET(XERCESC_PATH "C:/Program Files (x86)/CodeSynthesis XSD 4.0/xerces-c-3.1.1")

message(STATUS "Xerces-c lib path [${XERCESC_PATH}]" )

#----
#LIBXML2
#----
SET(LIBXML2_PATH "C:/projects/libxml2-2.7.8.win32")
message(STATUS "Lib XML 2 path [${LIBXML2_PATH}]" )

#-----
#XML Libs
#-----
if(NOT TARGET libxercesc) 
	add_library(libxercesc STATIC IMPORTED)
	set_property(TARGET libxercesc PROPERTY IMPORTED_LOCATION ${XERCESC_PATH}/xerces-c_3D.lib)		
endif()
if(NOT TARGET custlibxml) 
	add_library(custlibxml STATIC IMPORTED)
	set_property(TARGET custlibxml PROPERTY IMPORTED_LOCATION ${LIBXML2_PATH}/lib/libxml2.lib)	
endif()
if(NOT TARGET custeay32) 
	add_library(custeay32 STATIC IMPORTED)
	set_property(TARGET custeay32 PROPERTY IMPORTED_LOCATION ${OPENSSL_PATH}/lib/libeay32.lib)
endif()

SET( XML_LIBS Rpcrt4 crypt32 ws2_32 custeay32 libxercesc custlibxml)

#-----
#GoogleTest
#-----
include_directories(
	${PROJECT_SOURCE_DIR}/GoogleTest/gtest/src/gtest/include
)

add_definitions(-DSUPPORT_XML_CONFIG -Wall -DWIN32_LEAN_AND_MEAN)
set(CMAKE_CXX_FLAGS_RELEASE "/MD")
set(CMAKE_CXX_FLAGS_DEBUG "/MDd /Zi")

SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG bin/)
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE bin/)