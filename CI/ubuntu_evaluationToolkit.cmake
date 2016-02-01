#OPC UA Toolkit
SET( OPCUA_TOOLKIT_PATH "/opt/OpcUaToolkit-1.3.3-evaluation/" )
SET( OPCUA_TOOLKIT_LIBS_DEBUG "-luamoduled -lcoremoduled -luabased -luastackd -luapkid -lssl -lcrypto -lxmlparserd -lxml2  -lpthread" ) 
SET( OPCUA_TOOLKIT_LIBS_RELEASE "-luamodule -lcoremodule -luabase -luastack -luapki -lssl -lcrypto -lxmlparser -lxml2  -lpthread")

#Boost
SET( BOOST_PATH_HEADERS "" )
SET( BOOST_PATH_LIBS "" )
SET( BOOST_LIBS "-lboost_program_options -lboost_system" )

#XML
SET( XML_LIBS "-lxerces-c" ) 

#Other options
SET(CMAKE_EXECUTABLE_SUFFIX ".slc6_evaluationtoolkit.exe" )

add_definitions(-DSUPPORT_XML_CONFIG -Wall -DWIN32_LEAN_AND_MEAN -Wno-literal-suffix)
set(CMAKE_CXX_FLAGS_RELEASE "-m32 -static-libstdc++ -std=c++11")
set(CMAKE_CXX_FLAGS_DEBUG "-m32 -static-libstdc++ -std=c++11")

 
