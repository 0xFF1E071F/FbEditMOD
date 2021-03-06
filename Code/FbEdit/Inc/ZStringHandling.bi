

Declare Sub DePackStr OverLoad (ByRef i As Integer, Byval pSource As ZString Ptr, ByRef pDest As ZString Ptr)
Declare Sub DePackStr OverLoad (ByRef i As Integer, ByRef Source As ZString, ByRef Dest As ZString, ByVal DestSize As Integer)
Declare Sub GetSubStr OverLoad (ByRef i As Integer, ByRef Source As ZString, ByRef Dest As ZString, ByVal DestSize As Integer, ByVal Delimiter As UByte)
Declare Sub GetSubStr OverLoad (ByRef i As Integer, ByRef Source As ZString, ByRef Dest As ZString, ByVal DestSize As Integer, Byref Delimiter As ZString)
Declare Sub SplitStr (ByRef Source As ZString, ByVal Delimiter As UByte, ByRef pPartB As ZString Ptr)
Declare Sub SplitStrQuoted (ByRef Source As ZString, ByVal Delimiter As UByte, ByRef pPartB As ZString Ptr)
Declare Sub GetEnclosedStr OverLoad (ByRef i As Integer, ByRef Source As ZString, ByRef Dest As ZString, ByVal DestSize As Integer, ByVal StartDelimiter As UByte, ByVal EndDelimiter As UByte)
Declare Sub GetEnclosedStr OverLoad (ByRef i As Integer, ByRef Source As ZString, ByRef Dest As ZString, ByVal DestSize As Integer, Byref StartDelimiter As ZString, Byref EndDelimiter As ZString)

Declare Sub ReplaceChar1stHit (Byref Source As ZString, ByVal SearchChar As UByte, ByVal ReplaceChar As UByte)
Declare Sub GetLineFromChar (ByRef Source As ZString, ByVal CharPos As Integer, ByRef Dest As ZString, ByVal DestSize As Integer, ByRef LineCount As Integer)
Declare Sub ZStrReplaceChar (ByVal lpszStr As UByte Ptr, ByVal nByte As UByte, Byval nReplace As UByte)
Declare Sub TrimWhiteSpace (ByRef Work As ZString)
Declare Function InZStr (ByRef i As Integer, ByRef Source As ZString, ByRef Find As ZString) As Integer
Declare Sub ZStrCat Cdecl (ByVal pTarget As ZString Ptr, ByVal TargetSize As Integer, ByVal ArgCount As Integer, ByVal pFirst As ZString Ptr, ...)
Declare Sub RemoveChars (Byref Source As ZString, ByRef CharList As ZString)
Declare Sub KeepChars (ByRef Source As ZString, ByRef CharList As ZString)
Declare Function EncloseString (ByRef Source As ZString, ByVal SourceSize As Integer, ByVal EncloseChar As UByte) As BOOL


Declare Sub FormatFunctionName (ByRef FuncDescIn As ZString, ByRef FuncDescOut As ZString)
Declare Function FormatDEVStr (ByRef Source As ZString, ByVal SourceSize As Integer) As BOOL



#Macro IsZStrNotEmpty (ZStrName)
    ((ZStrName)[0] <> NULL)
#EndMacro

#Macro IsZStrEmpty (ZStrName)
    ((ZStrName)[0] = NULL)
#EndMacro

#Macro IsZStrNotEmpty2 (ZStrName)
    (StrPtr (ZStrName) <> 0) AndAlso ((ZStrName)[0] <> NULL)
#EndMacro

#Macro IsZStrEmpty2 (ZStrName)
    (StrPtr (ZStrName) = 0) OrElse ((ZStrName)[0] = NULL)
#EndMacro

#Macro SetZStrEmpty (ZStrName)
    (ZStrName)[0] = NULL
#EndMacro

