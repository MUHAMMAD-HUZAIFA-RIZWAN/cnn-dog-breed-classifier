#!/bin/sh
#
# PROGRAMMER: Jennifer S. (Udacity starter file)
# DATE CREATED: 02/08/2018
# REVISED DATE: 02/27/2018
# MODIFIED BY: Muhammad Huzaifa Rizwan
# MODIFIED DATE: 26/10/2026
# PURPOSE: Runs all three models on the uploaded images.
#          Output from each run is stored in results/uploaded_images/.
#

python check_images.py --dir uploaded_images/ --arch resnet  --dogfile dognames.txt > results/uploaded_images/resnet_uploaded-images.txt
python check_images.py --dir uploaded_images/ --arch alexnet --dogfile dognames.txt > results/uploaded_images/alexnet_uploaded-images.txt
python check_images.py --dir uploaded_images/ --arch vgg  --dogfile dognames.txt > results/uploaded_images/vgg_uploaded-images.txt
