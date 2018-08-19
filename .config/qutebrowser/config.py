# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# general
c.editor.command = ["gnome-terminal", "--wait", "-x", "nvim", "-f", "{}"]

# fingerprinting
#c.content.headers.user_agent = ""  # empty is the default
# generic user agent
c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0" 
c.content.headers.custom = {} # empty is the default
# generic HTTP_ACCEPT header
# TODO there is currently a default header that can't be deleted, only appended to. raise issue?
# c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.canvas_reading = False

# searchengines
c.url.searchengines["d"] = "https://duckduckgo.com/?q={}"
c.url.searchengines["yt"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines["w"] = "https://en.wikipedia.org/wiki/Special:Search/{}" 
c.url.searchengines["gh"] = "https://github.com/search?q={}"
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["arx"] = "https://arxiv.org/search/?query={}"
c.url.searchengines["jl"] = "https://docs.julialang.org/en/stable/search/?q={}"
c.url.searchengines["wa"] = "https://www.wolframalpha.com/input/?i={}"

# commands
config.bind(";v", "hint links spawn mpv {hint-url}")  # view video with mpv

# fonts
c.fonts.tabs = "9pt Monospace Regular"
c.fonts.statusbar = "9pt Monospace Regular"
c.fonts.downloads = c.fonts.statusbar 
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "13px Monospace Regular"
c.fonts.messages.info = "10pt Monospace Regular"
c.fonts.keyhint = c.fonts.messages.info
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar

# dracula colors
dracula = {}
dracula["background"] = "#282A36"
dracula["selection"]  = "#44475A"
dracula["foreground"] = "#F8F8F2"
dracula["comment"]    = "#6272A4"
dracula["cyan"]       = "#8BE9FD"
dracula["green"]      = "#50FA7B"
dracula["orange"]     = "#FFB86C"
dracula["pink"]       = "#FF79C6"
dracula["purple"]     = "#BD93F9"
dracula["red"]        = "#FF5555"
dracula["yellow"]     = "#F1FA8C"


# colors
c.colors.completion.fg = dracula["comment"]
c.colors.completion.category.fg = dracula["purple"]
c.colors.completion.category.bg = dracula["background"]
c.colors.completion.odd.bg = dracula["background"]
c.colors.completion.even.bg = dracula["background"]
c.colors.completion.item.selected.fg = dracula["cyan"]
c.colors.completion.item.selected.bg = dracula["background"]
c.colors.completion.item.selected.border.top = dracula["purple"]
c.colors.completion.item.selected.border.bottom = dracula["purple"]
c.colors.completion.match.fg = dracula["pink"]
c.colors.statusbar.normal.fg = dracula["comment"]
c.colors.statusbar.normal.bg = dracula["background"]
c.colors.statusbar.insert.fg = dracula["selection"]
c.colors.statusbar.insert.bg = dracula["green"]
c.colors.statusbar.command.bg = dracula["background"]
c.colors.statusbar.command.fg = dracula["foreground"]
c.colors.statusbar.caret.bg = dracula["purple"]
c.colors.statusbar.caret.selection.fg = dracula["selection"]
c.colors.statusbar.progress.bg = dracula["selection"]
c.colors.statusbar.passthrough.bg = dracula["red"]
c.colors.statusbar.url.fg = c.colors.statusbar.normal.fg
c.colors.statusbar.url.success.http.fg = dracula["foreground"]
c.colors.statusbar.url.success.https.fg = dracula["foreground"]
c.colors.statusbar.url.error.fg = dracula["red"]
c.colors.statusbar.url.warn.fg = dracula["orange"]
c.colors.statusbar.url.hover.fg = dracula["foreground"]
c.colors.tabs.bar.bg = dracula["background"]
c.colors.tabs.even.fg = dracula["comment"]
c.colors.tabs.even.bg = dracula["background"]
c.colors.tabs.odd.fg = dracula["comment"]
c.colors.tabs.odd.bg = dracula["background"]
c.colors.tabs.selected.even.fg = dracula["cyan"]
c.colors.tabs.selected.even.bg = dracula["comment"]
c.colors.tabs.selected.odd.fg = dracula["cyan"]
c.colors.tabs.selected.odd.bg = dracula["comment"]
c.colors.tabs.indicator.start = dracula["cyan"]
c.colors.tabs.indicator.stop = dracula["cyan"]
c.colors.tabs.indicator.error = dracula["red"]
c.colors.hints.bg = dracula["yellow"]
c.colors.hints.match.fg = dracula["purple"]
c.colors.downloads.start.fg = dracula["foreground"]
c.colors.downloads.start.bg = dracula["background"]
c.colors.downloads.stop.fg = dracula["foreground"]
c.colors.downloads.stop.bg = dracula["background"]
c.colors.keyhint.fg = dracula["foreground"]
c.colors.keyhint.suffix.fg = dracula["foreground"]
c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"
c.colors.messages.error.bg = dracula["red"]
c.colors.messages.error.fg = dracula["background"]
c.colors.messages.warning.bg = dracula["orange"]
c.colors.messages.warning.fg = dracula["background"]
c.colors.messages.info.bg = dracula["purple"]
c.colors.messages.info.fg = dracula["background"]
c.colors.prompts.fg = dracula["selection"]
c.colors.prompts.bg = dracula["purple"]
c.colors.prompts.selected.bg = dracula["green"]
