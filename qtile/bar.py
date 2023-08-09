from libqtile.bar import Bar
from libqtile.widget import KeyboardKbdd
from libqtile.widget.battery import Battery
from libqtile.widget.clock import Clock
from libqtile.widget.cpu import CPU
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.memory import Memory
from libqtile.widget.net import Net
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.window_count import WindowCount
from libqtile.widget.windowname import WindowName

from unicodes import left_half_circle, right_arrow, left_arrow, right_half_circle
from colors import gruvbox

BAR_HEIGHT = 20
# BAR_MARGIN = 5

bar = Bar([
    GroupBox(
        disable_drag=True,
        active=gruvbox['magenta'],
        inactive=gruvbox['dark-hard'],
        highlight_method='line',
        block_highlight_text_color=gruvbox['red'],
        borderwidth=0,
        highlight_color=gruvbox['bg'],
        background=gruvbox['bg'],
        # spacing=2
    ),
    CurrentLayout(
        background=gruvbox['red'],
        foreground=gruvbox['gray'],
        margin=5,
    ),
    right_arrow(gruvbox['fg'], gruvbox['red']),
    WindowCount(
        text_format='{num}',
        background=gruvbox['fg'],
        foreground=gruvbox['gray'],
        show_zero=True,
    ),

    WindowName(
        background=gruvbox['bg'],
        foreground=gruvbox['fg']
    ),

    CPU(
        format=' {freq_current}GHz {load_percent}%',
        background=gruvbox['dark-hard'],
        foreground=gruvbox['red']
    ),

    Memory(
        format='{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
        background=gruvbox['dark-hard'],
        foreground=gruvbox['cyan']
    ),
    Battery(
        background=gruvbox['fg3'],
        format='{char} {percent:2.0%} {hour:d}:{min:02d}'
    ),

    Systray(
        background=gruvbox['bg']
    ),

    KeyboardKbdd(
        background=gruvbox['bg'],
        configured_keyboards=['us', 'ru']
    ),

    Clock(
        background=gruvbox['bg'],
        foreground=gruvbox['fg'],
        format='%Y-%m-%d %a %I:%M %p'
    ),
],
    # background=nord_fox['bg'],
    size=BAR_HEIGHT,
    margin=5,
)