# TODO really need to make it super simple to package compile this

atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn("unable to load Revise", e)
    end
    try
        @eval begin
            using OhMyREPL
            # hacky fix for []] issue
            @async (sleep(1); OhMyREPL.Prompt.insert_keybindings())
            import OhMyREPL: Passes.SyntaxHighlighter; const SH = SyntaxHighlighter
            OhMyREPL.Passes.SyntaxHighlighter.add!("Dracula", begin
                cs = SH.ColorScheme()
                SH.symbol!(cs, OhMyREPL.Crayon(foreground = (255,184,108)))
                SH.comment!(cs, OhMyREPL.Crayon(foreground = (98, 114, 164)))
                SH.string!(cs, OhMyREPL.Crayon(foreground = (241, 250, 140)))
                SH.call!(cs, OhMyREPL.Crayon(foreground = (189, 147, 249)))
                SH.op!(cs, OhMyREPL.Crayon(foreground = (255, 121, 198)))
                SH.keyword!(cs, OhMyREPL.Crayon(foreground = (255, 121, 198)))
                SH.text!(cs, OhMyREPL.Crayon(foreground = (248, 248, 242)))
                SH.macro!(cs, OhMyREPL.Crayon(foreground = (80, 250, 123)))
                SH.function_def!(cs, OhMyREPL.Crayon(foreground = (189, 147, 249)))
                SH.error!(cs, OhMyREPL.Crayon(foreground = (255, 85, 85)))
                SH.argdef!(cs, OhMyREPL.Crayon(foreground = (139, 233, 253)))
                SH.number!(cs, OhMyREPL.Crayon(foreground = (255, 85, 85)))
                cs
            end)
            colorscheme!("Dracula")
        end
    catch e
        @warn("unable to load OhMyREPL", e)
    end
end
