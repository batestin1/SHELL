#/bin/bash


echo "LET'S BUILD YOUR PYPI PROJECT"

pip install mkdirPypi

echo "Enter project name: "
read filename
echo "from mkdirPypi import *" > python.py
echo "mkdirPypi('$filename')">> python.py

python python.py
sleep 3
rm python.py

