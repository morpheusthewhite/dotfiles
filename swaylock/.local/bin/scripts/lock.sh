#!/bin/bash

images=()
swaylock_args=()

for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
  image=$(mktemp --suffix=.png)
  images+=($image)
  swaylock_args+=(-i $output:$image)
  grim -o $output $image
  corrupter -mag 2 -boffset 35 $image $image
done

# printf '%s\n' "${images[@]}" | xargs -P 0 -I{} convert -blur 0x8 {} {}

swaylock ${swaylock_args[@]} -s center
rm ${images[@]}
