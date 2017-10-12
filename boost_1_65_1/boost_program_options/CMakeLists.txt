# ------------------------------------------------------------------------------

set(MODULE_NAME boost_program_options)

# ------------------------------------------------------------------------------

set(MODULE_SOURCES 
	../libs/program_options/src/cmdline.cpp
	../libs/program_options/src/config_file.cpp
	../libs/program_options/src/convert.cpp
	../libs/program_options/src/options_description.cpp
	../libs/program_options/src/parsers.cpp
	../libs/program_options/src/positional_options.cpp
	../libs/program_options/src/split.cpp
	../libs/program_options/src/utf8_codecvt_facet.cpp
	../libs/program_options/src/value_semantic.cpp
	../libs/program_options/src/variables_map.cpp    
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
