package mangroves_utils

import "core:strings"
import types "../mangroves_types"
 
InitSystem :: proc() -> types.System {
  return types.System{
    IsDebugging=false,
    LogInfo= strings.builder_make(),
    MainMenuInfo = types.MainMenuInformation{
      FileSubOpen= false,
    },
  }
}

DestroySystem :: proc(system: ^types.System) {
  // Cleanup if needed
  strings.builder_destroy(&system.LogInfo)
}