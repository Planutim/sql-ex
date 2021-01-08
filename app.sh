#!/usr/bin/awk -f
BEGIN { FS=OFS=","}

{
    for (i = 1; i <= NF; ++i){
	    if (i==5||i==3||i==4)
	    	$i = "'" $i "'"
    }
    print
}
