return {
  {
    -- Override LazyVim’s core plugin to run our AMPL setup early
    "LazyVim/LazyVim",
    init = function()
      -- 1) Filetype detection for .ampl and .mod
      vim.filetype.add({
        extension = {
          ampl = "ampl",
          mod = "ampl",
          run = "ampl",
          dat = "ampl",
        },
      })

      -- 2) Embed the AMPL Vim syntax definitions
      vim.cmd([[
        if exists("b:current_syntax")
          finish
        endif

        " Enable case-sensitive matching
        syntax case match

        " Keywords
        syntax keyword amplConditional          else if then
        syntax keyword amplRepeat               for repeat while until
        syntax keyword amplStatement            data maximize minimize model solve
        syntax match   amplStatement            /subject to/
        syntax keyword amplDeclaration          arc node param set var function let
        syntax keyword amplType                 binary integer symbolic in default logical
        syntax keyword amplOperator             break reset check
        syntax match   amplConstant             "[+-]\?Infinity"
        syntax keyword amplLogicalOperator      and or not exists forall complements
        syntax keyword amplArithmeticOperator   sum prod

        " Number and Float Matching
        syntax match   amplNumber               "\<\d\+[ij]\=\>"
        syntax match   amplFloat                "\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=\>"

        " String Matching
        syntax region  amplString               start=+'+ skip=+\\\\'+ end=+'+
        syntax region  amplString               start=+"+ skip=+\\\\"+ end=+"+

        " Comments
        syntax match   amplComment              /#.*/

        " Special Characters
        syntax match   amplColon                ":"
        syntax match   amplAssignment           ":="
        syntax match   amplSemicolon            ";"

        " Blocks
        syntax region  amplBlock                start=/{/ end=/}/ contains=ALL

        " Highlight Groups
        hi link amplConditional          Conditional
        hi link amplRepeat               Repeat
        hi link amplStatement            Statement
        hi link amplDeclaration          Typedef
        hi link amplType                 Type
        hi link amplLogicalOperator      Operator
        hi link amplArithmeticOperator   Operator
        hi link amplNumber               Number
        hi link amplFloat                Float
        hi link amplComment              Comment
        hi link amplString               String
        hi link amplBlock                Normal
        hi link amplColon                SpecialChar
        hi link amplAssignment           Delimiter
        hi link amplSemicolon            SpecialChar

        " Mark syntax as loaded
        let b:current_syntax = "ampl"
      ]])
    end,
  },
}
