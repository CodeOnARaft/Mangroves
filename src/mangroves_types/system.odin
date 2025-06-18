package mangroves_types

import "core:strings"
 import enums "../mangroves_enums"

System :: struct {
    CurrentView: enums.SystemView, // Current view of the system, e.g., Resources, Map, Tilesets
    IsDebugging: bool,
    LogInfo: strings.Builder,
    LogUpdated : bool, // Indicates if the log has been updated since the last check
    LogShowWindow : bool, // Indicates if the log window should be shown
    MainMenuInfo : MainMenuInformation,
    CurrentProject: Project,
    ShutDownInitialted: bool, // Indicates if the shutdown process has been initiated
    ProgramExit: bool, // Indicates if the program should exit
    DialogUpdate: SystemDialogUpdate, // Function pointer for dialog updates
    DialogDraw: SystemDialogDraw, // Function pointer for dialog drawing
}