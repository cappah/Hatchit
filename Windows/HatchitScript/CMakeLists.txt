
include_directories("../../HatchitCore/include"
                    "../../HatchitCore/source/inline"
					"../../HatchitMath/include"
					"../../HatchitMath/source/inline
					"
                    "../../HatchitScript/include"
                    "C:/Program Files/Python35/include"
                    "C:/Program Files/Python35/PC")
                    

link_directories("C:/Program Files/Python35/libs")
					
file(GLOB HT_SCRIPT_INC ../../HatchitScript/include/*.h)
file(GLOB HT_SCRIPT_SRC ../../HatchitScript/source/*.cpp)

add_definitions(-D_UNICODE)

add_library(HatchitScript SHARED ${HT_SCRIPT_INC} ${HT_SCRIPT_SRC})

target_compile_definitions(HatchitScript PRIVATE HT_NONCLIENT_BUILD)

set(PYTHON_LIBS debug python35_d optimized python35)
target_link_libraries(HatchitScript HatchitCore ${PYTHON_LIBS})


