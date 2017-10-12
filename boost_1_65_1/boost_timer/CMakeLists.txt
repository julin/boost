# ------------------------------------------------------------------------------

set(MODULE_NAME boost_timer)

# ------------------------------------------------------------------------------

set(MODULE_SOURCES
	../libs/timer/src/auto_timers_construction.cpp
	../libs/timer/src/cpu_timer.cpp
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
		${MODULE_DEFINES}
	PUBLIC
		${BOOST_DEFINES}
)

# ------------------------------------------------------------------------------

if(${PREFERRED_LIBRARY_TYPE} STREQUAL "SHARED")
	target_link_libraries(${MODULE_NAME}
		boost_system
		boost_date_time
		boost_chrono
	)
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


