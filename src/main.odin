package main

import "rlmu"
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import mu "vendor:microui"
import ui "mangroves_ui"
import utils "mangroves_utils"
import types "mangroves_types"




main :: proc() {

    system := utils.InitSystem()
    defer utils.DestroySystem(&system)

    rl.SetWindowState({ .WINDOW_RESIZABLE })
    rl.InitWindow(720, 600, "Mangroves")
    rl.MaximizeWindow()
    defer rl.CloseWindow()

    ctx := rlmu.init_scope() // same as calling, `rlmu.init(); defer rlmu.destroy()`
bg : [3]u8 = { 90, 95, 100 }

    for !rl.WindowShouldClose() {
        defer free_all(context.temp_allocator)

       

        rl.BeginDrawing(); defer rl.EndDrawing()
        rl.ClearBackground({ bg.r, bg.g, bg.b, 255 })
        
        rlmu.begin_scope()  // same as calling, `rlmu.begin(); defer rlmu.end()`
        ui.DrawEditor(&system,ctx)

        //demo windows
        ui.style_window(ctx)
        ui.test_window(ctx,&system,&bg)
       
    } 
}

