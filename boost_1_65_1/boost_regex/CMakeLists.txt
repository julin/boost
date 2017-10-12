# ------------------------------------------------------------------------------

set(MODULE_NAME boost_regex)

# ------------------------------------------------------------------------------

set(MODULE_SOURCES
	../libs/regex/src/cpp_regex_traits.cpp
	../libs/regex/src/cregex.cpp
	../libs/regex/src/c_regex_traits.cpp
	../libs/regex/src/fileiter.cpp
	../libs/regex/src/icu.cpp
	../libs/regex/src/instances.cpp
	../libs/regex/src/posix_api.cpp
	../libs/regex/src/regex.cpp
	../libs/regex/src/regex_debug.cpp
	../libs/regex/src/regex_raw_buffer.cpp
	../libs/regex/src/regex_traits_defaults.cpp
	../libs/regex/src/static_mutex.cpp
	../libs/regex/src/usinstances.cpp
	../libs/regex/src/w32_regex_traits.cpp
	../libs/regex/src/wc_regex_traits.cpp
	../libs/regex/src/wide_posix_api.cpp
	../libs/regex/src/winstances.cpp
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
