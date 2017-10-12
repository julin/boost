# ------------------------------------------------------------------------------
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

message("Processing boost...")

# ------------------------------------------------------------------------------

set(BOOST_POSTFIX "-1.61")

# ------------------------------------------------------------------------------

set(BOOST_DEFINES)
list(APPEND BOOST_DEFINES "-DBOOST_ALL_NO_LIB")

# ------------------------------------------------------------------------------
set (PREFERRED_LIBRARY_TYPE "STATIC")

if(${PREFERRED_LIBRARY_TYPE} STREQUAL "SHARED" )
	list(APPEND BOOST_DEFINES "-DBOOST_ALL_DYN_LINK")
endif()

# ------------------------------------------------------------------------------

set(BOOST_INCLUDES ${CMAKE_CURRENT_SOURCE_DIR})

# ------------------------------------------------------------------------------

# add all _LIBRARIES
foreach(_LIBRARIES
	boost_date_time
	boost_filesystem
	boost_regex
	boost_system
	boost_chrono
	boost_thread
	boost_timer
	boost_program_options
	boost_atomic
	boost_random
)
	add_subdirectory("${_LIBRARIES}")
endforeach(_LIBRARIES)

# ------------------------------------------------------------------------------

# Tidy up solution 
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(TARGET boost_date_time			PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_filesystem		PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_regex				PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_system			PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_chrono			PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_thread			PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_timer				PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_program_options	PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_atomic			PROPERTY FOLDER "3p/boost" )
set_property(TARGET boost_random			PROPERTY FOLDER "3p/boost" )

# ------------------------------------------------------------------------------
