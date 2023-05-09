# PDF Translation

This repo provides a shell script for the conversion of pdf files to plain-text for the purposes of translation. This implementation utilizes the job array functionality of slurm to process all files in parallel. 
Parallelization may not be necessary for small corpora. 

## File Overview

[translate.sh](translate.sh) utilizes imagemagick, tesseract, and [Translate Shell](https://www.soimort.org/translate-shell/) to OCR pdf files and translate them to/from languages of your choice. Should also work on tiffs with light tweaking.

[translate.sbatch](translate.sbatch) invokes the shell script and runs as a slurm array. 

## Usage Instructions

### Connecting to Sherlock

To connect to Sherlock
```
ssh yourSUNetID@sherlock.stanford.edu
```
in your terminal program of choice. 

### Arranging the files

Once you are logged in, you'll want to have access to the files in this repo, which you can get with a couple simple commands:

```bash
git clone https://github.com/bcritt1/translate.git
```

This will create a directory in your home space on Sherlock called "translate" with all the files in this repository.

While we're here, let's also create directories for our outputs:
```bash
mkdir foreignLanguagePDFs out err
```
At this point, you'll want to transfer your files onto Sherlock and place them in the foreignLanguagePDFs directory:
```bash
rsync /path/to/files/on/your/pc SUNetID@sherlock.stanford.edu/~/foreignLanguagePDFs/
```

Next, we need to give the computer permission to run our shell script:
```
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
