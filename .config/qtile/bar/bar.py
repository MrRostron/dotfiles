from colors.colors import colors
from libqtile import bar, qtile
from libqtile.lazy import lazy
from libqtile.widget import (Battery, Clock, CurrentLayout, GroupBox,
                             PulseVolume, Spacer, Systray, TextBox, WindowName)
from qtile_extras.widget.decorations import PowerLineDecoration

# ─── Widget defaults ───────────────────────────────────────────────────────
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=6,
    foreground=colors["fg-main"],
    background=colors["bg-main"],
)

extension_defaults = widget_defaults.copy()

powerline = {
        "decorations": [
            PowerLineDecoration(path="arrow_right")
            ]
        }
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
            GroupBox(
                fontsize=13,
                font="JetBrainsMono Nerd Font",
                padding_x=6,
                padding_y=4,
                borderwidth=2,
                active=colors["magenta"],
                inactive=colors["bg-inactive"],
                highlight_color=colors["gray"],
                this_current_screen_border=colors["success"],
                this_screen_border=colors["gray"],
                other_current_screen_border=colors["gray"],
                other_screen_border=colors["gray"],
                urgent_border=colors["red"],
                highlight_method="line",
                foreground=colors["fg-main"],
            ),
            # Center – focused window name
            Spacer(),
            WindowName(
                max_chars=60,
                foreground=colors["fg-main"],
                fontsize=13,
                padding=12,
            ),
            Spacer(),
            # Battery (only shows if you have a battery)
            Clock(
                format="%a %d %b  %H:%M",
                padding=10,
                foreground=colors["fg-main"],
                
            ),
            TextBox(
                text="   ",
                padding=2,
            ),
        ],
        28,  # bar height
        margin=[0, 0, 1, 0],  # top, right, bottom, left
        border_width=[0, 0, 0, 0],
        border_color=colors["magenta"],
        background=colors["bg-main"],
    )
