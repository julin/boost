# ------------------------------------------------------------------------------

set(MODULE_NAME boost_random)

# ------------------------------------------------------------------------------

set(MODULE_SOURCES 
	../libs/random/src/random_device.cpp
)

# ------------------------------------------------------------------------------

add_library(${MODULE_NAME} 
	${PREFERRED_LIBRARY_TYPE}
	${MODULE_SOURCES}
)

# ------------------------------------------------------------------------------

target_include_directories(${MODULE_NAME}
	PRIVATE
		${BOOST_INCLUDES}
	PUBLIC
		${BOOST_INCLUDES}
)

# ------------------------------------------------------------------------------

target_compile_definitions(${MODULE_NAME} 
	PRIVATE
		${BOOST_DEFINES}
	PUBLIC
		${BOOST_DEFINES}
)

# ------------------------------------------------------------------------------

if(${PREFERRED_LIBRARY_TYPE} STREQUAL "SHARED" )
	target_link_libraries(${MODULE_NAME} boost_system)
endif()

# ------------------------------------------------------------------------------

if(LINUX)
	target_link_libraries(${MODULE_NAME} dl rt)
endif()

# ------------------------------------------------------------------------------

if(COMMAND apply_target_settings)
	apply_target_settings(${MODULE_NAME})
endif()

# ------------------------------------------------------------------------------

set_property(TARGET ${MODULE_NAME} PROPERTY DEBUG_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY RELEASE_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY MINSIZEREL_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY RELWITHDEBINFO_POSTFIX ${BOOST_POSTFIX})

# ------------------------------------------------------------------------------
