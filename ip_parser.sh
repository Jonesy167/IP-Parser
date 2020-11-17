#!/bin/bash

#'available @ https://github.com/jonesy167

if [ $# -eq 0 ]; then
    echo ""
    echo "Error no arguments provided Usage: -i <input file> -o <output file> -d <delimeter> (delimeter can be set to 1 for ',' 2 for ', ' 3 for new line)"
    exit 1
fi

#show help
if [ "$1" == "-h" ]; then   
  echo ""
  echo "Usage: `basename $0` -i <input file> -o <output file> -d <delimeter> (delimeter can be set to 1 for ',' 2 for ', ' 3 for new line)"
  exit 0
fi


#check and store arguments
while getopts "i:o:d:" opt; do
case $opt in
o)


output=$OPTARG >&2  #set output file variable
;;

i)
input=$OPTARG >&2   #set input file variable
;;

d)
delim=$OPTARG # set delimeter variable
;;

#check for valid and complete  input
*)
echo ""111
echo "Error invalid option or argument $OPTARG" 
;;
esac

if [ "$#" -ne 6 ]; then #check there are 3 arguments supplied
echo ""
echo "Error you must enter -i inputfile -o output file -d delimiter value 1 (,) 2 (, ) 3 (new line)"
fi

done

if [ "$delim" -gt 3 ]; then #check delimiter variable is set to 1, 2 or 3
echo ""
echo "Error delimeter -d options are 1 (,) 2 (, ) 3 (new line)"
fi


# parse input file and output IP's to output file
grep  -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' $input > $output

# format the data to meet the delimeter requirement

if [ $delim -eq 3 ] #no need to format by default data is on new line
then
exit  0
fi

if [ $delim -eq 1 ] # append , with no spaces
then
sed 's/$/,/' $output > text454253 #append ,
cat text454253|tr -d '\n' > $output
rm text454253
fi


if [ $delim -eq 2 ] # append , with spaces
then
sed 's/$/,/' $output > text454253 #append ,
cat text454253|tr -d '\n' > $output
sed -i 's/,/, /g' $output
rm text454253
fi
