#!/bin/bash

# Adapted from Andrew Aklaghi's script here: https://programminghistorian.org/en/lessons/OCR-and-Machine-Translation

DIR=/farmshare/learning/data/foreignLanguagePDFs/
FILES=/farmshare/learning/data/foreignLanguagePDFs/*.pdf
wget git.io/trans
chmod +x ./trans
for f in $FILES;
do
  	tiff=${f%.*}.tiff
        convert -density 400 $f -depth 8 -strip -background white -alpha off $tiff
        ocr=${f%.*}_ocr
        tlate=${f%.*}_trans
	tesseract $tiff $ocr -l rus
	./trans :en file://$ocr.txt > $tlate.txt
	sleep 1m
done

mkdir $DIR"/ocr"
mkdir $DIR"/tiff"
mkdir $DIR"/tlate"
mv $DIR/*_ocr.txt $DIR/ocr
mv $DIR/*.tiff $DIR/tiff
mv $DIR/*_trans.txt $DIR/tlate
