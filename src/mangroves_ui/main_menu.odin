package mangroves_ui

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import util "../mangroves_utils"
import mu "vendor:microui"
import types "../mangroves_types"



DrawMainMenu :: proc(system: ^types.System,ctx : ^mu.Context) {
    if rl.IsMouseButtonPressed(.LEFT) {
        
       system.MainMenuInfo.FileSubOpen = false
    }
     x : mu.Options = { .NO_TITLE, .NO_CLOSE, .NO_RESIZE, .NO_SCROLL };
     if mu.begin_window(ctx, "MenuBar", {0, 0, rl.GetScreenWidth(), 30}, x) {
            mu.layout_row(ctx, []i32{60, 60, 60, -1}, 25) // Fixed widths, last one fills
            
            if.SUBMIT in mu.button(ctx, "File") {
                fmt.println("File menu clicked!")
            }
            if .SUBMIT in  mu.button(ctx, "Edit") {
                fmt.println("Edit menu clicked!")
            }
            if .SUBMIT in mu.button(ctx, "Help") {
                fmt.println("View menu clicked!")
            }
            // Empty space for the -1 width
            
            mu.end_window(ctx)
        }
    
}

