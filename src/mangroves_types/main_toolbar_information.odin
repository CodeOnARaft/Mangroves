package mangroves_types

MainToolBarInformation :: struct {
    FileSubOpen : bool,
    EditSubOpen : bool,
    ViewSubOpen : bool,
    HelpSubOpen : bool,

    FileNewProject : bool,
    FileOpenProject : bool,
    FileSaveProject : bool,
    FileSaveAsProject : bool,
    FileExit : bool,

    EditUndo : bool,
    EditRedo : bool,
    EditCut : bool,
    EditCopy : bool,
    EditPaste : bool,

    ViewToggleGrid : bool,
    ViewToggleSnapToGrid : bool,

    HelpAboutMangrovesEditor : bool,
}