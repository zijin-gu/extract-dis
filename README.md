# Extract distance matrix for HCP data.
The example approach to extract Euclidean distance matrices for HCP data. Typically, this example is for N=86 regions (FS86) and all the unrelated subjects in it.

## Dataset
You can find the dataset information here:
https://humanconnectome.org/study/hcp-young-adult/document/1200-subjects-data-release/

And if you use it to publish something, please cite according to this: 
https://www.humanconnectome.org/study/hcp-young-adult/document/hcp-citations

## Requirements
1. AWS https://wiki.humanconnectome.org/display/PublicData/How+To+Connect+to+Connectome+Data+via+AWS
2. Matlab
3. Brainnet Viewer https://www.nitrc.org/projects/bnv/
4. FSL https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation/MacOsX

## Steps
### 1. Download the nii.gz file for all subjects using aws.
Here is an example path: s3://hcp-openaccess/HCP_1200/${subj}/T1w/wmparc.nii.gz
You can use download_hcp.sh together with your txt file which contains all the subjects' ID to run on your shell.
Example:
```
bash download_hcp.sh subjects_unrelated420_scfc.txt
```
You can change the txt file for other subjects you want to download.
### 2. Extract the distance matrices.
Be sure to run the FSL Setup for Matlab before doing the following.
You can then use the extract_dis.m file run on your Matlab to extract the distance matrices for all the subjects you want. Make sure you change the file path correctly for you own.
The results matrices will be saved in `Distance`.
