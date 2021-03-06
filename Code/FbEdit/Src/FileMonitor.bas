

    #Include Once "windows.bi"

    #Include Once "Inc\Addins.bi"
    #Include Once "Inc\FbEdit.bi"
    #Include Once "Inc\FileIO.bi"
    #Include Once "Inc\Language.bi"
    #Include Once "Inc\Resource.bi"
    #Include Once "Inc\SpecHandling.bi"
    #Include Once "Inc\TabTool.bi"

    #Include Once "Inc\FileMonitor.bi"

    Declare Sub FileMonitorProc (ByVal hWin As HWND, ByVal uMsg As UINT, ByVal idEvent As UINT, ByVal dwTime As DWORD)

    #Define IDT_FILEMONITOR       200

    Dim Shared TimerRunning As UINT




Sub FileMonitorStart ()

    If TimerRunning = 0 Then
        TimerRunning = SetTimer (ah.hwnd, IDT_FILEMONITOR, 2000, Cast (TIMERPROC, @FileMonitorProc))
    EndIf

End Sub


Sub FileMonitorStop ()

    If TimerRunning Then
        KillTimer ah.hwnd, IDT_FILEMONITOR
        TimerRunning = 0
    EndIf

End Sub


Sub FileMonitorProc (ByVal hWin As HWND, ByVal uMsg As UINT, ByVal idEvent As UINT, ByVal dwTime As DWORD)

    Dim tci      As TCITEM
    Dim i        As Integer         = 0
    Dim hFile    As HANDLE          = Any
    Dim ft       As FILETIME        = Any
    Dim buffer   As ZString  * 1024 = Any
    Dim ExitCode As Integer         = Any

    tci.mask = TCIF_PARAM

    'Print "FileMon:"; idEvent; ":"; dwTime

    Do
        If SendMessage (ah.htabtool, TCM_GETITEM, i, Cast (LPARAM ,@tci)) Then
            GetLastWriteTime pTABMEM->filename, @ft
            If CompareFileTime (@ft, @pTABMEM->ft) > 0 Then

                FileMonitorStop
                buffer = pTABMEM->filename + CR + GetInternalString (IS_FILE_CHANGED_OUTSIDE_EDITOR) + CR + GetInternalString (IS_REOPEN_THE_FILE)
                ExitCode = MessageBox (ah.hwnd, @buffer, @szAppName, MB_YESNO Or MB_ICONEXCLAMATION)

                If ExitCode = IDYES Then
                    ReadTheFile pTABMEM->hedit, pTABMEM->filename             ' Reload file
                    SetFileInfo pTABMEM->hedit, pTABMEM->filename
                EndIf

                GetLastWriteTime pTABMEM->filename, @pTABMEM->ft
                FileMonitorStart
            EndIf
        Else
            Exit Do
        EndIf
        i += 1
    Loop

End Sub
