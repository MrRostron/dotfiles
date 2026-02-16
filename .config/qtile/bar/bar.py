# ~/.config/qtile/config.py  (or widgets.py / bar.py)

from libqtile import bar, qtile
from libqtile.widget import (
    CurrentLayout,
    GroupBox,
    WindowName,
    TextBox,
    PulseVolume,
    Battery,
    Clock,
    Systray,
    Spacer,
)
from libqtile.lazy import lazy

# ─── Colors ────────────────────────────────────────────────────────────────
# Very recommended: define colors in one place (you can later move to colors.py)
colors = {
    "bg":      "#1e1e2e",     # dark background
    "fg":      "#cdd6f4",     # main text
    "accent":  "#89b4fa",     # blue-ish accent
    "red":     "#f38ba8",
    "green":   "#a6e3a1",
    "yellow":  "#f9e2af",
    "gray":    "#585b70",
    "inactive": "#6c7086",
}

# ─── Widget defaults ───────────────────────────────────────────────────────
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",    # or "FiraCode Nerd Font", "CascadiaCode NF", etc.
    fontsize=13,
    padding=6,
    foreground=colors["fg"],
    background=colors["bg"],
)

extension_defaults = widget_defaults.copy()

# ─── Bar definition ────────────────────────────────────────────────────────
def get_bar():
    return bar.Bar(
        [
            # Left side
            TextBox(
                text="    ",
                fontsize=16,
                foreground=colors["accent"],
                padding=2,
            ),
            CurrentLayout(
                fmt="{}",
                foreground=colors["accent"],
                padding=8,
            ),
            GroupBox(
                fontsize=13,
                font="JetBrainsMono Nerd Font",
                padding_x=6,
                padding_y=4,
                borderwidth=2,
                active=colors["fg"],
                inactive=colors["inactive"],
                highlight_color=colors["gray"],
                this_current_screen_border=colors["accent"],
                this_screen_border=colors["gray"],
                other_current_screen_border=colors["gray"],
                other_screen_border=colors["gray"],
                urgent_border=colors["red"],
                highlight_method="line",
                foreground=colors["fg"],
            ),

            # Center – focused window name
            Spacer(),
            WindowName(
                max_chars=60,
                foreground=colors["fg"],
                fontsize=13,
                padding=12,
            ),
            Spacer(),

            # Right side
            # PulseVolume (needs pulseaudio or pipewire-pulse)
            PulseVolume(
                fmt="  {}",
                padding=8,
                foreground=colors["yellow"],
            ),


            # Battery (only shows if you have a battery)
            Battery(
                format=" {char} {percent:2.0f}% ",
                charge_char="↑",
                discharge_char="↓",
                empty_char="✖",
                full_char="✓",
                padding=8,
                foreground=colors["yellow"],
                show_short_text=False,
            ),

            Clock(
                format="%a %d %b  %H:%M",
                padding=10,
                foreground=colors["fg"],
            ),

            Systray(
                padding=6,
                icon_size=18,
            ),

            TextBox(
                text="   ",
                padding=2,
            ),
        ],
        28,                     # bar height
        margin=[4, 8, 2, 8],    # top, right, bottom, left
        border_width=[0, 0, 2, 0],
        border_color=colors["accent"],
        background=colors["bg"],
    )



