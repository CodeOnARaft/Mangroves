package mangroves_ui

//import "rlmu"
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import mu "vendor:microui"
import types "../mangroves_types"
import utils "../mangroves_utils"



DrawEditor :: proc(system:^types.System, ctx : ^mu.Context) {
  if mu.begin_window(ctx, "x", mu.Rect{ 10, 10, 300, 200 }) {
        defer mu.end_window(ctx)
  }

    DrawMainMenu(system, ctx)
    utils. DrawLogWindow(system,ctx)

}
