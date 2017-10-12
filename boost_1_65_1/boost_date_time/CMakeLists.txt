# ------------------------------------------------------------------------------

set(MODULE_NAME boost_date_time)

# ------------------------------------------------------------------------------

set(MODULE_SOURCES 
	../libs/date_time/src/gregorian/date_generators.cpp
	../libs/date_time/src/gregorian/gregorian_types.cpp
	../libs/date_time/src/gregorian/greg_month.cpp
	../libs/date_time/src/gregorian/greg_weekday.cpp
	../libs/date_time/src/posix_time/posix_time_types.cpp  
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

if(LINUX)
	target_link_libraries(${MODULE_NAME} dl rt)
endif()

# ------------------------------------------------------------------------------

set_property(TARGET ${MODULE_NAME} PROPERTY DEBUG_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY RELEASE_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY MINSIZEREL_POSTFIX ${BOOST_POSTFIX})
set_property(TARGET ${MODULE_NAME} PROPERTY RELWITHDEBINFO_POSTFIX ${BOOST_POSTFIX})

# ------------------------------------------------------------------------------
