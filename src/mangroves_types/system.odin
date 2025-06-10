package mangroves_types

import "core:strings"
 

System :: struct {
    IsDebugging: bool,
    LogInfo: strings.Builder,
    LogUpdated : bool, // Indicates if the log has been updated since the last check
    MainMenuInfo : MainMenuInformation,
}