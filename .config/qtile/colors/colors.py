# modus_vivendi_colors.py
#
# Modus Vivendi (dark variant) color palette
# Extracted from official Modus themes documentation
# https://protesilaos.com/emacs/modus-themes-colors
#
# Use in your Qtile config like:
# from colors.colors import colors
#colors["bg-main"], colors["blue"], etc.

colors = {
    # Backgrounds
    "bg-main":      "#000000",    # Main background (pure black)
    "bg-dim":       "#1e1e1e",    # Slightly raised / dim background
    "bg-alt":       "#181a26",    # Common subtle alternative bg
    "bg-active":    "#535353",    # Active/selected region bg
    "bg-inactive":  "#303030",    # Inactive window/area bg
    "border":       "#646464",    # Border / subtle divider

    # Foregrounds / text
    "fg-main":      "#ffffff",    # Primary text / foreground
    "fg-dim":       "#989898",    # Dim / secondary text
    "fg-alt":       "#c6c6c6",    # Alternative foreground

    # Core accent colors
    "red":          "#ff5f5f",    # or #ff5f87 in some mappings
    "red-warmer":   "#ff6f5f",
    "red-cooler":   "#ff7f9f",

    "green":        "#5fd75f",
    "green-warmer": "#9acd32",
    "green-cooler": "#00afaf",

    "yellow":       "#ffff00",    # Bright / gold
    "yellow-warmer": "#ffdf00",

    "blue":         "#338fff",    # Main vivid blue
    "blue-warmer":  "#3f8fff",
    "blue-cooler":  "#00afff",

    "magenta":      "#ff66ff",
    "magenta-alt":  "#ff8fff",

    "cyan":         "#00d0ff",
    "cyan-warmer":  "#40e0d0",

    # Very useful semantic / UI colors (often remapped in Modus)
    "accent":       "#338fff",          # Often used for focus / selection
    "success":      "#5fd75f",          # Green-ish success
    "warning":      "#ffdf00",          # Yellow warning
    "error":        "#ff5f5f",          # Red error/destructive
    "highlight":    "#3a3a5e",          # Subtle highlight bg
    "cursor":       "#00d0ff",          # Common cursor / pointer accent

    # Extra common ones people remap/use
    "gray":         "#646464",
    "gray-light":   "#989898",
    "gray-dark":    "#303030",
}

