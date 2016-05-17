include_directories("../../HatchitCore/include"
					"../../HatchitCore/source/inline"
					"../../HatchitMath/include"
					"../../HatchitMath/source/inline"
					"../../HatchitGame/include")
                    
file(GLOB HT_SCRIPT_SWIG ../../HatchitScript/pysource/*.h)
file(GLOB HT_SCRIPT_WRAP ../../HatchitScript/pysource/*.cpp)

find_package(PythonLibs)
include_directories(${PYTHON_INCLUDE_DIRS})

add_definitions(-D_UNICODE)

add_library(HatchitScriptModule SHARED ${HT_SCRIPT_SWIG} ${HT_SCRIPT_WRAP}  )

set_target_properties(HatchitScriptModule  PROPERTIES OUTPUT_NAME _HatchitScript SUFFIX .pyd DEBUG_POSTFIX _d)

target_link_libraries(HatchitScriptModule ${PYTHON_LIBRARIES})