#!/bin/bash
​
​
#read the first argument you give when you run the script as subj_num
#you want this to be a text file that contains all of subject IDs that you need to download
#in the text file there should be one subject ID per line
subj_num=$1
​
#loop through the lines of the file
while read subj; do
     #copy the wmparc.2 file for a given subject to your current directory
     aws s3 cp s3://hcp-openaccess/HCP_1200/${subj}/T1w/wmparc.nii.gz ./wmparc_new/wmparc_${subj}.nii.gz --profile hcp
#end once you've looped through all lines of the file
done < $subj_num