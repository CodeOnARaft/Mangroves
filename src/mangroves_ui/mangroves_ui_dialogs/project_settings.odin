package mangroves_ui_dialogs

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import mu "vendor:microui"
import types "../../mangroves_types"

dialog_draw_project_settings :: proc(system: ^types.System, ctx: ^mu.Context) {
       if mu.begin_window(ctx, "Project Settings", mu.Rect{ 350, 40, 300, 200 }) {
        defer mu.end_window(ctx)
        window := mu.get_current_container(ctx)
       }
}