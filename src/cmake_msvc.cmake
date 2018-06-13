macro(configure_msvc_runtime triplet)
  if(MSVC)
    # Default to statically-linked runtime.
    if(${triplet} MATCHES "static")
      message(STATUS "${triplet} -> forcing use of statically-linked runtime.")
	  set(_SEARCH "/MD")
	  set(_REPLACE "/MT")
      set(MSVC_RUNTIME "static")
	else()
      message(STATUS "${triplet} -> forcing use of dynamically-linked runtime.")
	  set(_SEARCH "/MT")
	  set(_REPLACE "/MD")
    endif()

    # Set compiler options.
    set(variables CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELEASE CMAKE_C_FLAGS_RELWITHDEBINFO
				  CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELWITHDEBINFO)

    foreach(variable ${variables})
		if(${variable} MATCHES "${_SEARCH}")
          string(REGEX REPLACE "${_SEARCH}" "${_REPLACE}" ${variable} "${${variable}}")
        endif()
    endforeach()

	#dump_list(variables)

  endif()
endmacro()

macro(dump_all)
	get_cmake_property(_variableNames VARIABLES)
	list (SORT _variableNames)
	foreach (_variableName ${_variableNames})
		message(STATUS "${_variableName}=${${_variableName}}")
	endforeach()
endmacro()

macro(dump_list _lst)
	foreach (_variableName ${${_lst}})
		message(STATUS "${_variableName}=${${_variableName}}")
	endforeach()
endmacro()