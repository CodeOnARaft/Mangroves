package mangroves_ui

//import "rlmu"
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import mu "vendor:microui"
import types "../mangroves_types"
import utils "../mangroves_utils"



DrawEditor :: proc(system:^types.System, ctx : ^mu.Context) {  

    DrawMainMenu(system, ctx)

    if system.LogShowWindow {
       utils. DrawLogWindow(system,ctx)
    }

    if system.ShutDownInitialted {
            system.ProgramExit = true
    }
}
