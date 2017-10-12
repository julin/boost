# ------------------------------------------------------------------------------

set(MODULE_NAME boost_thread)

# ------------------------------------------------------------------------------

set(MODULE_DEFINES)

# ------------------------------------------------------------------------------

if(${PREFERRED_LIBRARY_TYPE} STREQUAL "SHARED" )
	list(APPEND MODULE_DEFINES "-DBOOST_THREAD_BUILD_DLL")
endif()

# ------------------------------------------------------------------------------

if(WIN32)
	set(MODULE_SOURCES
		../libs/thread/src/win32/thread.cpp
		../libs/thread/src/win32/tss_dll.cpp
		../libs/thread/src/tss_null.cpp
		../libs/thread/src/future.cpp
	)
	list(APPEND MODULE_DEFINES "-DBOOST_THREAD_BUILD_LIB")
endif()

# ------------------------------------------------------------------------------

if(UNIX)
	set(MODULE_SOURCES
		../libs/thread/src/pthread/once_atomic.cpp
		../libs/thread/src/pthread/thread.cpp
		../libs/thread/src/tss_null.cpp
		../libs/thread/src/future.cpp
	)
endif()

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

if(${PREFERRED_LIBRARY_TYPE} STREQUAL "SHARED" )
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


