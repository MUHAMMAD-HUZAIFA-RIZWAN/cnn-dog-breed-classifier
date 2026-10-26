#!/bin/sh
#
# PROGRAMMER: Jennifer S. (Udacity starter file)
# DATE CREATED: 02/08/2018
# REVISED DATE: 02/27/2018
# MODIFIED BY: Muhammad Huzaifa Rizwan
# MODIFIED DATE: 26/10/2026
# PURPOSE: Runs all three models to test which provides the best solution.
#          Output from each run is stored in results/pet_images/.
#

python check_images.py --dir pet_images/ --arch resnet  --dogfile dognames.txt > results/pet_images/resnet_pet-images.txt
python check_images.py --dir pet_images/ --arch alexnet --dogfile dognames.txt > results/pet_images/alexnet_pet-images.txt
python check_images.py --dir pet_images/ --arch vgg  --dogfile dognames.txt > results/pet_images/vgg_pet-images.txt
