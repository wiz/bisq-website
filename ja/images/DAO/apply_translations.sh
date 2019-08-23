#!/usr/bin/env zsh
lines=$(tail +2 ./for_use_bisq-website_images_ja.yml|wc -l)
patterns=(`tail +2 ./for_use_bisq-website_images_ja.yml|cut -d : -f1|sed -e 's/^  //' -e 's/ /\./g'`)
replacements=(`tail +2 ./for_use_bisq-website_images_ja.yml|cut -d : -f2`)
echo performing $lines replacements
i=1
until [ $i = $lines ];do
	echo "$i) replacing '$patterns[$i]' with '$replacements[$i]'"
	for file in *.svg;do
		sed -i -e "s/>$patterns[$i]</>$replacements[$i]</" "${file}"
	done
	((i++))
done
