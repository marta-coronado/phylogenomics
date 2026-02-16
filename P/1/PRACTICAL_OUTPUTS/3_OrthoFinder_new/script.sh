#!/usr/bin/env bash

conda activate orthofinder_py310

cd "/home/mcoronado/3_OrthoFinder"
DIR="."

# Move to the folder exercise3. There you will find two directories: set_a which contains the data of two species, and set_b which contains the data of three species.

orthofinder -f set_a/
orthofinder -f set_b/