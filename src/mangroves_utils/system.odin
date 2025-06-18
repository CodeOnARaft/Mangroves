package mangroves_utils

import "core:strings"
import types "../mangroves_types"
import enums "../mangroves_enums"

 
InitSystem :: proc() -> types.System {
  return types.System{
    CurrentView = enums.SystemView.Resources, // Default view is Resources
    IsDebugging=false,
    LogInfo= strings.builder_make(),
    MainMenuInfo = types.MainMenuInformation{
      FileSubOpen= false,
    },
    LogUpdated = false,
    CurrentProject = types.Project{
      name = "New Project",
      description = "",
      version = "0.1",
    },
  }
}

DestroySystem :: proc(system: ^types.System) {
  // Cleanup if needed
  strings.builder_destroy(&system.LogInfo)
}