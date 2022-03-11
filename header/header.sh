#/bin/bash

echo "Let's create your python files!"

pip install pip install fileheaderPy

echo "Enter the name of the file you want to create: "
read file
echo "from fileheaderPy import *" > python.py
echo "fileheaderPy('$file')" >> python.py
chmod 777 python.py

python python.py
rm python.py
sleep 3
