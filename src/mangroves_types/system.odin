package mangroves_types

import "core:strings"
 

System :: struct {
    IsDebugging: bool,
    LogInfo: strings.Builder,
    LogUpdated : bool, // Indicates if the log has been updated since the last check
    LogShowWindow : bool, // Indicates if the log window should be shown
    MainMenuInfo : MainMenuInformation,
    CurrentProject: Project,
    ShutDownInitialted: bool, // Indicates if the shutdown process has been initiated
    ProgramExit: bool, // Indicates if the program should exit
}