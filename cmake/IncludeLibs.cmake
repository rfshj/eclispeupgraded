# Include libraries
add_library(imgui INTERFACE)
# Use official Dear ImGui; the old EclipseMenu/imgui repository is unavailable.
CPMAddPackage("gh:ocornut/imgui@1.92.3")
target_include_directories(imgui INTERFACE ${imgui_SOURCE_DIR})
target_sources(imgui INTERFACE
    ${imgui_SOURCE_DIR}/imgui.cpp
    ${imgui_SOURCE_DIR}/imgui_widgets.cpp
    ${imgui_SOURCE_DIR}/imgui_tables.cpp
    ${imgui_SOURCE_DIR}/imgui_draw.cpp
    ${imgui_SOURCE_DIR}/imgui_demo.cpp
    ${imgui_SOURCE_DIR}/misc/cpp/imgui_stdlib.cpp
)
set(HAS_IMGUI ON)
set(IMGUI_HOOK_EARLY OFF)

CPMAddPackage("gh:matcool/gd-imgui-cocos#9764333")
CPMAddPackage("gh:prevter/msgpack-for-matjson#16a7957")
CPMAddPackage("gh:maxnut/GDR-converter#71104a9")
CPMAddPackage("gh:EclipseMenu/rift@2.0.2")
CPMAddPackage("gh:prevter/AdvancedLabel#7e0eff9")
CPMAddPackage("gh:prevter/sinaps#7d2f7b1")

if (WIN32)
    CPMAddPackage("gh:zyantific/zydis#ae12a09")
endif ()

if (CMAKE_BUILD_TYPE STREQUAL "Debug" AND WIN32)
    target_compile_definitions(rift PRIVATE _HAS_ITERATOR_DEBUGGING=0)
endif()

target_link_libraries(third_party INTERFACE
    GDRconverter
    libGDR
    imgui
    imgui-cocos
    rift
    advanced_label
    sinaps
)

if (WIN32)
    target_link_libraries(third_party INTERFACE Zydis Zycore)
endif ()
