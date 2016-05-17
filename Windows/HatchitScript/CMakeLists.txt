
include_directories("../../HatchitCore/include"
                    "../../HatchitCore/source/inline"
					"../../HatchitMath/include"
					"../../HatchitMath/source/inline"
					"../../HatchitScript/pysource"
                    "../../HatchitScript/include"
                    "C:/Program Files/Python35/include"
                    "C:/Program Files/Python35/PC")
                    
					
file(GLOB HT_SCRIPT_INC ../../HatchitScript/include/*.h)
file(GLOB HT_SCRIPT_SRC ../../HatchitScript/source/*.cpp)

find_package(PythonLibs)
include_directories(${PYTHON_INCLUDE_DIRS})

add_definitions(-D_UNICODE)

add_library(HatchitScript SHARED ${HT_SCRIPT_INC} ${HT_SCRIPT_SRC} )

target_compile_definitions(HatchitScript PRIVATE HT_NONCLIENT_BUILD)

target_link_libraries(HatchitScript HatchitCore ${PYTHON_LIBS}  ${PYTHON_LIBRARIES})


