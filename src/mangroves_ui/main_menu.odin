package mangroves_ui

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"
import util "../mangroves_utils"
import mu "vendor:microui"
import types "../mangroves_types"
import dialogs "./mangroves_ui_dialogs"



DrawMainMenu :: proc(system: ^types.System,ctx : ^mu.Context) {
   fileSubOpen:bool  = false
   editSubOpen  :bool= false 
    viewSubOpen  :bool= false
    helpSubOpen  :bool= false

     x : mu.Options = { .NO_TITLE, .NO_CLOSE, .NO_RESIZE, .NO_SCROLL };
     if mu.begin_window(ctx, "MenuBar", {0, 0, rl.GetScreenWidth(), 30}, x) {
            mu.layout_row(ctx, []i32{60, 60, 60, -1}, 25) // Fixed widths, last one fills
            
            if.SUBMIT in mu.button(ctx, "File") {
                system.MainMenuInfo.FileSubOpen = true
                fileSubOpen = true
            }
            if .SUBMIT in  mu.button(ctx, "Edit") {
             system.MainMenuInfo.EditSubOpen  = true
                editSubOpen = true
            }
            if .SUBMIT in mu.button(ctx, "Help") {
              system.MainMenuInfo.HelpSubOpen = true
                helpSubOpen = true
            }
            // Empty space for the -1 width
            
            mu.end_window(ctx)
        }



    if system.MainMenuInfo.FileSubOpen {
         x : mu.Options = { .NO_TITLE, .NO_CLOSE, .NO_RESIZE, .NO_SCROLL };
        if mu.begin_window(ctx, "File Menu", {0, 30, 200, 150},x) {
            defer mu.end_window(ctx)
            
            mu.layout_row(ctx, []i32{ -1 }, 25) // Fill the width
            
            if .SUBMIT in mu.button(ctx, "New Project") {
               // util.CreateNewProject(system)
            }
            if .SUBMIT in mu.button(ctx, "Open Project") {
                //util.OpenProject(system)
            }
            if .SUBMIT in mu.button(ctx, "Save Project") {
                //util.SaveProject(system)
            }
            if .SUBMIT in mu.button(ctx, "Exit") {
               system.ShutDownInitialted = true
            }
        }
    }

    if system.MainMenuInfo.EditSubOpen {
         x : mu.Options = { .NO_TITLE, .NO_CLOSE, .NO_RESIZE, .NO_SCROLL };
        if mu.begin_window(ctx, "Edit Menu", {70, 30, 200, 150},x) {
            defer mu.end_window(ctx)
            
            mu.layout_row(ctx, []i32{ -1 }, 25) // Fill the width
            
            if .SUBMIT in mu.button(ctx, "Project Settings") {
                system.DialogDraw = dialogs.dialog_draw_project_settings
            }
            if .SUBMIT in mu.button(ctx, "Redo") {
                //util.Redo(system)
            }
        }
    }

    if system.MainMenuInfo.HelpSubOpen {
         x : mu.Options = { .NO_TITLE, .NO_CLOSE, .NO_RESIZE, .NO_SCROLL };
        if mu.begin_window(ctx, "Help Menu", {140, 30, 200, 150},x) {
            defer mu.end_window(ctx)
            
            mu.layout_row(ctx, []i32{ -1 }, 25) // Fill the width
            
            if .SUBMIT in mu.button(ctx, "Show Log Window") {
               system.LogShowWindow = true
            }
            if .SUBMIT in mu.button(ctx, "About") {
                //util.ShowAbout(system)
            }
        }
    }

     if rl.IsMouseButtonPressed(.LEFT) {
        
       system.MainMenuInfo.FileSubOpen = fileSubOpen
           system.MainMenuInfo.EditSubOpen = editSubOpen
           system.MainMenuInfo.HelpSubOpen = helpSubOpen
           system.MainMenuInfo.ViewSubOpen = viewSubOpen
 
    }
    
}

