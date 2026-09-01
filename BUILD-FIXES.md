# Build fixes

- Removed the failing Discord Presence FetchContent dependency. Discord RPC source is excluded from this build because its unavailable external package was blocking CMake configuration.
- Removed the translations FetchContent step.
- Replaced the unavailable EclipseMenu/imgui dependency with official Dear ImGui 1.92.3.
- Clean Win32 build script.
- Cheat indicator: green when cheats are active, red when no cheats are active.
- GitHub upload helper targets rfshj/eclispeupgraded.
