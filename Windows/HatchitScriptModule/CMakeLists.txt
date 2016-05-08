include_directories("../../HatchitMath/include"
					"../../HatchitMath/source/inline"
                    "C:/Program Files/Python35/include"
                    "C:/Program Files/Python35/PC")
					
link_directories("C:/Program Files/Python35/libs")
                    
file(GLOB HT_SCRIPT_WRAP ../../HatchitScript/pysource/*.cpp)

add_definitions(-D_UNICODE)

add_library(HatchitScriptModule SHARED ${HT_SCRIPT_WRAP})

set(PYTHON_LIBS debug python35_d optimized python35)

set_target_properties(HatchitScriptModule  PROPERTIES OUTPUT_NAME _HatchitScript SUFFIX .pyd DEBUG_POSTFIX _d)