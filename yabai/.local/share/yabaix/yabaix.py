import json
import subprocess
import argparse

## parser

def create_parser():
    parser = argparse.ArgumentParser(description='Yabai extension utilities')
    subparsers = parser.add_subparsers()

    parser_focus_display_space = subparsers.add_parser("focus-display-space")
    parser_focus_display_space.add_argument("display", type=int)
    parser_focus_display_space.add_argument("space", type=int)
    parser_focus_display_space.set_defaults(handler=handle_focus_display_space)

    parser_focus_space_previous_safe = subparsers.add_parser("focus-space-previous-safe")
    parser_focus_space_previous_safe.set_defaults(handler=handle_focus_space_previous_safe)

    parser_focus_space_next_safe = subparsers.add_parser("focus-space-next-safe")
    parser_focus_space_next_safe.set_defaults(handler=handle_focus_space_next_safe)

    return parser

def parse_args():
    parser = create_parser()
    return parser.parse_args()

## yabai running commands

def yabai_run_parse(command: list) -> dict:
    # run a yabai command and parse its output
    completed_process = subprocess.run(command, capture_output=True)
    yabai_output = completed_process.stdout

    return json.loads(yabai_output)

def yabai_run(command: list):
    completed_process = subprocess.run(command)

## api 

def space_focus(space_index: int):
    yabai_run(["yabai", "-m", "space", "--focus", str(space_index)])

def get_displays() -> dict:
    return yabai_run_parse(["yabai", "-m", "query", "--displays"])

def get_spaces() -> dict:
    return yabai_run_parse(["yabai", "-m", "query", "--spaces"])

def get_display(display_index) -> dict:
    displays = get_displays()

    return list(filter(lambda display: display["index"] == display_index, displays))[0]

def get_first_display_space(display_index) -> int:
    display = get_display(display_index)
    return display["spaces"][0]

def get_space_focused() -> dict:
    spaces = get_spaces()

    return list(filter(lambda space: space["has-focus"], spaces))[0]

def compute_space_abs_index(display: int, space: int) -> int:
    first_display_index = get_first_display_space(display) 
    return first_display_index + space - 1

def focus_display_space(display: int, space: int):
    space_abs_index = compute_space_abs_index(display, space)
    space_focus(space_abs_index)

def is_first_space_of_display(space: dict) -> bool:
    display = get_display(space["display"])

    return int(display["spaces"][0]) == int(space["index"])

def is_last_space_of_display(space: dict) -> bool:
    display = get_display(space["display"])

    return int(display["spaces"][-1]) == int(space["index"])

def focus_space_previous_safe():
    space_focused = get_space_focused()
    if not is_first_space_of_display(space_focused):
        space_focus(space_focused["index"] - 1)

def focus_space_next_safe():
    space_focused = get_space_focused()
    if not is_last_space_of_display(space_focused):
        space_focus(space_focused["index"] + 1)

### handlers

def handle_focus_display_space(args):
    return focus_display_space(args.display, args.space)

def handle_focus_space_previous_safe(args):
    return focus_space_previous_safe()

def handle_focus_space_next_safe(args):
    return focus_space_next_safe()

### main

def main():
    args = parse_args()
    args.handler(args)

if __name__ == "__main__":
    main()
