#! /bin/bash
if [ "$#" -ne 1 ]
then
  echo "Please provide new platform name..."
  exit 1
fi

mkdir data
cp data.tar.gz data
mv data.tar.gz data_orig.tar.gz
cd data
tar -xzvf data.tar.gz
rm data.tar.gz
sed -i "s/platform_replace_me/"$1"/g" etc/init.d/sam
tar -czvf data.tar.gz *
mv data.tar.gz ..
cd ..
rm -rf data

tar -czvf sam.tar.gz control.tar.gz data.tar.gz debian-binary
rm data.tar.gz
mv data_orig.tar.gz data.tar.gz
mv sam.tar.gz sam.ipk
