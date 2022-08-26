local bgcolor_inactive = '#1e2127'
local bgcolor_active = '#282c34'

local highlights = {
  BufferLineFill = {fg='#5c6370', bg='#16181c'},
  
  BufferLineSeparator = {fg='#16181c', bg=bgcolor_inactive},
  BufferLineSeparatorSelected = {fg='#16181c', bg=bgcolor_active},
  BufferLineSeparatorVisible = {fg='#16181c', bg=bgcolor_active},

  BufferLineTab = {fg='#5c6370', bg=bgcolor_inactive},
  BufferLineTabSeparator = {fg='#16181c', bg=bgcolor_inactive},
  BufferLineTabSelected = {fg='#61afef', bg=bgcolor_active},

  --BufferLineBufferVisible = {fg='#80a0ff', bg=bgcolor_active},
  --
  BufferLineNumbers = {fg=bgcolor_inactive},
  BufferLineBackground = {fg='#5c6370', bg=bgcolor_inactive},
  BufferLineDiagnostic = {fg='#454a54', bg=bgcolor_inactive},

  BufferLineDuplicate = {cterm={italic = true}, bg=bgcolor_inactive, italic=true},
  BufferLineError = {fg='#5c6370', bg=bgcolor_inactive, sp='#ff0000'},
  BufferLineWarning = {fg='#5c6370', bg=bgcolor_inactive, sp='#ffa500'},
  BufferLineInfo = {fg='#5c6370', bg=bgcolor_inactive, sp='#add8e6'},
  BufferLineHint = {fg='#5c6370', bg=bgcolor_inactive, sp='#d3d3d3'},


  --BufferLineNumbers = {bg=bgcolor_inactive},
  BufferLineOffsetSeparator = {bg=bgcolor_inactive},
  BufferLineErrorDiagnostic = {fg='#454a54', bg=bgcolor_inactive, sp='#bf0000'},
  BufferLineWarningDiagnostic = {fg='#454a54', bg=bgcolor_inactive, sp='#bf7b00'},
  BufferLineInfoDiagnostic = {fg='#454a54', bg=bgcolor_inactive, sp='#81a2ac'},
  BufferLineHintDiagnostic = {fg='#454a54', bg=bgcolor_inactive, sp='#9e9e9e'},

  BufferLineModified = {fg='#98c379', bg=bgcolor_inactive},
  BufferLineModifiedVisible = {fg='#98c379', bg=bgcolor_active},
  BufferLineModifiedSelected = {fg='#98c379', bg=bgcolor_active},

  BufferLineIndicatorSelected = {fg='#61afef', bg=bgcolor_active},
  BufferLineIndicatorVisible = {fg='#24282f', bg=bgcolor_active},
  BufferLineGroupSeparator = {fg='#5c6370', bg='#16181c'},

  BufferLineBuffer = {fg='#5c6370', bg=bgcolor_inactive},
}

require('colors').set_hls(highlights)
