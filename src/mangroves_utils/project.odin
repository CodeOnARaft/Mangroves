package mangroves_utils

import rl "vendor:raylib"
import types "../mangroves_types"
import strings "core:strings"

ProjectUpdated :: proc(system: ^types.System) {
    title := strings.concatenate({system.CurrentProject.name, " - Mangroves Editor"})
    defer delete(title)
    rl.SetWindowTitle(strings.clone_to_cstring(title))
}

