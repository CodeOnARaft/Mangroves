# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Mangroves is a simple tile editor built in Odin using Raylib for graphics and MicroUI for the interface. The application provides a UI for managing tilesets, maps, and resources for tile-based game development.

## Build Commands

```bash
# Build the project
odin build src -out:mangroves

# Run the built executable
./mangroves
```

## Architecture

### Core System Structure

The application follows a modular architecture organized into several packages:

- **`main.odin`**: Entry point that initializes the system, window, and main render loop
- **`mangroves_types/`**: Core data structures and type definitions
  - `System`: Central state management with current view, debugging, logging, project info
  - `Project`: Project metadata (name, description, version)
  - `MainMenuInformation` and `MainToolbarInformation`: UI state structures
- **`mangroves_enums/`**: Enumeration definitions
  - `SystemView`: Application views (Resources, Map, Tilesets)
- **`mangroves_ui/`**: UI rendering and interaction logic
  - `DrawEditor()`: Main UI rendering entry point
  - `DrawMainMenu()`: Main menu rendering
- **`mangroves_utils/`**: Utility functions
  - System initialization and cleanup
  - Debug logging functionality
  - Project management utilities
- **`rlmu/`**: Raylib-MicroUI integration bridge
  - Provides seamless integration between Raylib graphics and MicroUI widgets
  - Handles input forwarding, atlas rendering, and UI command processing

### Rendering Flow

1. Main loop initializes system and Raylib window
2. `rlmu` package handles MicroUI context setup and input forwarding
3. `DrawEditor()` renders the current UI state based on `System.CurrentView`
4. UI commands are processed through the rlmu bridge to Raylib rendering

### State Management

The `System` struct acts as the central state container, managing:
- Current application view (Resources/Map/Tilesets)
- Debug logging and window visibility
- Project information
- Application lifecycle (shutdown, exit)

### Dependencies

- **Odin**: Programming language and compiler
- **Raylib**: Graphics and windowing (`vendor:raylib`)
- **MicroUI**: Immediate mode GUI (`vendor:microui`)
- **rlmu**: Custom bridge between Raylib and MicroUI