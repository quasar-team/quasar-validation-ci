# @author Damian Abalo
# @date 03-Sep-2015
# The purpose of this file is to set default parameters in case no build configuration file (aka toolchain) was specified.

# The approach is to satisfy the requirements as much as possible.

message("using build configuration from open62541WindowsCIConfiguration.cmake")


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
SET(XERCESC_PATH "C:/projects/xerces-c-3.1.2/Build/Win64/VC10/Debug")

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

add_definitions( -DBACKEND_OPEN62541 )

add_definitions(-DSUPPORT_XML_CONFIG -Wall -DWIN32_LEAN_AND_MEAN)

set(CMAKE_CXX_FLAGS_RELEASE "/MD")
set(CMAKE_CXX_FLAGS_DEBUG "/MDd /Zi")

SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG bin/)
SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE bin/)

set(BACKEND_SERVER_MODULES open62541 open62541-compat)