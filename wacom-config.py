from dataclasses import dataclass
from time import sleep
import subprocess

# To configure
PPI = 93
DISPLAY_WIDTH_PX = 2560
DISPLAY_HEIGHT_PX = 1440

CM_PER_INCH = 2.54

@dataclass
class Width:
    cm: float
    px: float


@dataclass
class Height:
    cm: float
    px: float

@dataclass
class Size:
    w: Width
    h: Height

def call(args):
    return subprocess.run([str(i) for i in args], capture_output=True, check=True, text=True).stdout

def wacom_device_id() -> int:
    devices = call(["xsetwacom", "list", "devices"]).split('\n')
    for device in devices:
        if device.__contains__("type: STYLUS"):
            id_nums = [int(i) for i in device if i.isdigit()]
            return int(''.join(map(str, id_nums)))

    raise Exception("No stylus detected")

def get_display_size() -> Size:
    w = Width(DISPLAY_WIDTH_PX/PPI*CM_PER_INCH, DISPLAY_WIDTH_PX)
    h = Height(DISPLAY_HEIGHT_PX/PPI*CM_PER_INCH, DISPLAY_HEIGHT_PX)
    return Size(w, h)

def get_tablet_size(device_id: int) -> Size:
    area = call(["xsetwacom", "get", str(device_id), "Area"]).split(' ')
    w_cm = int(area[2]) / 1000
    h_cm = int(area[3]) / 1000

    w = Width(w_cm, PPI/CM_PER_INCH*w_cm)
    h = Height(h_cm, PPI/CM_PER_INCH*h_cm)
    return Size(w, h)

def map_to_output(device_id: int, tablet_size: Size, display_size: Size):
    args = ["xsetwacom", "set", device_id, "MapToOutput", "{}x{}+{}+{}"
          .format(round(tablet_size.w.px), round(tablet_size.h.px),
                  round(display_size.w.px / 2 - tablet_size.w.px / 2),
                  round(display_size.h.px / 2 - tablet_size.h.px / 2))]
    print(args)
    call(args)

def set_tablet_area(device_id: int, tablet_size: Size):
    args = ["xsetwacom", "set", device_id, "Area", 0, 0, int(tablet_size.w.cm*1000), int(tablet_size.h.cm*1000)]
    print(args)
    call(args)

# To ensure the tablet is connected
sleep(1)

device_id = wacom_device_id()
display_size = get_display_size()
tablet_size = get_tablet_size(device_id)
print(device_id)
print(display_size)
print(tablet_size)

map_to_output(device_id, tablet_size, display_size)
set_tablet_area(device_id, tablet_size)

call(["/home/gregoire/.dotfiles/overlay", round(tablet_size.w.px), round(tablet_size.h.px)])
