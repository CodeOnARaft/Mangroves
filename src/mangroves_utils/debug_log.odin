package mangroves_utils

import "core:fmt"
import "core:strings"
import types "../mangroves_types"
import mu "vendor:microui"



log_input_text := make_slice([]u8, 128)
log_input_text_len : int


// removeLogLine removes the first line from the system's LogInfo string builder.
LogTrimLine :: proc(sys: ^types.System) {
    logContent := strings.to_string(sys.LogInfo)           // Use strings.to_string()
    newlineIndex := strings.index(logContent, "\n")        // Use strings.index() (lowercase)
    
    if newlineIndex == -1 {
        // No newline found, clear entire log.
        strings.builder_reset(&sys.LogInfo)                // Use strings.builder_reset()
        return
    }
    
    // Slice off the first line (including the newline) and update LogInfo.
    remaining := logContent[(newlineIndex + 1):]           // Fixed slice syntax
    strings.builder_reset(&sys.LogInfo)                    // Use strings.builder_reset()
    strings.write_string(&sys.LogInfo, remaining)          // Use strings.write_string()
}

DrawLogWindow :: proc (system: ^types.System,ctx : ^mu.Context,) {
    if mu.begin_window(ctx, "Log Window", mu.Rect{ 350, 40, 300, 200 }) {
        defer mu.end_window(ctx)

        /* output text panel */
        mu.layout_row(ctx, { -1 }, -25)
        mu.begin_panel(ctx, "Log Output")
        panel := mu.get_current_container(ctx)
        mu.layout_row(ctx, { -1 }, -1)
        mu.text(ctx, strings.to_string(system.LogInfo))
        mu.end_panel(ctx)
        if system.LogUpdated {
            panel.scroll.y = panel.content_size.y
            system.LogUpdated = false
        }
    
        /* input textbox + submit button */
        submitted := false
        mu.layout_row(ctx, { -70, -1 }, 0)

        if .SUBMIT in mu.textbox(ctx, log_input_text, &log_input_text_len) {
            mu.set_focus(ctx, ctx.last_id)
            submitted = true
        }
        if .SUBMIT in mu.button(ctx, "Submit") {
            submitted = true
        }

        if submitted == true {
            LogAppendText(system,string(log_input_text[:log_input_text_len]))
            log_input_text_len = 0
        }
    }
}

LogAppendText :: proc(system: ^types.System,text: string) {
    if strings.builder_len(system.LogInfo) != 0 {
        // Append newline if log isn't empty
        fmt.sbprint(&system.LogInfo, "\n")
    }
    fmt.sbprint(&system.LogInfo, text)
    system.LogUpdated = true
}