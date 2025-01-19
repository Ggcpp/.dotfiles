from dataclasses import dataclass
from time import sleep
import subprocess
import sys
import os

# To configure
# For some reason the wacom intuos pro L has a size x2 when doing "xsetwacom get <id> Area".. weird
NATIVE_SCALE_SIZE = 2
PPI = 93
DISPLAY_WIDTH_PX = 2560
DISPLAY_HEIGHT_PX = 1440
SCALE_FACTOR = 1.5
OVERLAY_PATH = str(os.environ.get("HOME")) + "/.dotfiles/overlay"

# Const
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

@dataclass
class Pos:
    x: float
    y: float

@dataclass
class Device:
    id: int
    size: Size

def call(args, input=None):
    return subprocess.run([str(i) for i in args], input=input, capture_output=True, check=True, text=True).stdout

def async_call(args):
    subprocess.Popen([str(i) for i in args], text=True)

def config_device(device: Device):
    call(["xsetwacom", "set", device.id, "Button", 2, "key rctrl"])

def get_device() -> Device:
    # Device id
    id = None;
    devices = call(["xsetwacom", "list", "devices"]).split('\n')
    for device in devices:
        if device.__contains__("type: STYLUS"):
            id_nums = [int(i) for i in device if i.isdigit()]
            id = int(''.join(map(str, id_nums)))

    if id == None:
        raise Exception("No stylus detected")

    # Device Size
    area = call(["xsetwacom", "get", str(id), "Area"]).split(' ')
    w_cm = int(area[2]) / NATIVE_SCALE_SIZE / 1000 * SCALE_FACTOR
    h_cm = int(area[3]) / NATIVE_SCALE_SIZE / 1000 * SCALE_FACTOR

    w = Width(w_cm, PPI/CM_PER_INCH*w_cm)
    h = Height(h_cm, PPI/CM_PER_INCH*h_cm)
    size = Size(w, h)

    return Device(id, size)

def map_to_output(device: Device, direction: str):
    coord = call(["curl", "-X", "POST", "-d", direction, "localhost:8080/move"]).split(' ')
    x = int(coord[0].split(":")[1])
    y = int(coord[1].split(":")[1])

    args = ["xsetwacom", "set", device.id, "MapToOutput", "{}x{}+{}+{}"
          .format(round(device.size.w.px),
                  round(device.size.h.px),
                  x,y)]
    async_call(args)

def start_overlay():
    device = get_device()
    print(device)
    async_call([OVERLAY_PATH, round(device.size.w.px), round(device.size.h.px)])

    config_device(device)
    map_to_output(device, "center")

def stop_overlay():
    async_call(["curl", "localhost:8080/stop"])

def move_overlay(direction: str):
    device = get_device()

    map_to_output(device, direction)


# To ensure the tablet is connected
# sleep(1)

def main():
    args = iter(sys.argv[1:])
    try:
        match next(args):
            case "start":
                start_overlay()
            case "stop":
                stop_overlay()
            case "move":
                direction = next(args)
                move_overlay(direction)
            case _:
                print("Unknown argument")
    except StopIteration:
        print("Not enough arguments")

if __name__ == "__main__":
    main()
