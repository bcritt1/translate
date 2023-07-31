# PDF Translation

This repo provides a shell script for the conversion of pdf files to plain-text for the purposes of translation. This implementation utilizes the job array functionality of slurm to process all files in parallel. 
Parallelization may not be necessary for small corpora. 

## File Overview

[translate.sh](translate.sh) utilizes imagemagick, tesseract, and [Translate Shell](https://www.soimort.org/translate-shell/) to OCR pdf files and translate them to/from languages of your choice. Should also work on tiffs with light tweaking.

[translate.sbatch](translate.sbatch) invokes the shell script and runs as a slurm array. 

## Usage Instructions

### Connecting to Farmshare

To connect to Farmshare
```
ssh yourSUNetID@rice.stanford.edu
```
in your terminal program of choice. 

### Arranging the files

Once you are logged in, you'll want to move to the files for this lesson:

```bash
cd /farmshare/learning/scripts/scripts/translate
```
While we're here, let's also create directories for our outputs:
```bash
mkdir /scratch/users/$USER/outputs ~/out ~/err
```
Next, we need to give the computer permission to run our shell script:
```bash
cd translate/
chmod +x translate.sh
```
If you ```ls``` now, you should see that your translate.sh file has changed colors, meaning it is now executable.

### Running the Script

We should be ready.
```
sbatch pdf_convert.sbatch
```
to run the shell script. The script will take your pdfs, convert them to .tiff files, then convert those .tiff files to plain text. It will create /tiff and /ocr directories inside the directory with your pdfs and send the .tiff and 
.txt files there respectively. You may or may not need the .tiff files, but the .txt files can be used as inputs for just about any of the text processing sub-repos you find here. 
