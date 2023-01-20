M1 TERMINAL NOTES
-----------------------------------------------------------------
Open Terminal Ctrl+Alt+T
pwd: directory current folder
ls: Folder content
ls -l: Folder content list information
which “program_name”: find location of things
echo “string” : prints the string
cat “filename”: view a file
cat > “filename”: to create a file
cat file1file2 > new filename: to concatenate file1 and file2
wget:?????
less “filename”: shows a file content 
top: live view with a list of apps with the most CPU utilisation. ctrl+c to quit
nano: create a script. ctrl+x to exit 
nano “filename” :  to open and do changes
vi “filename”: to edit a file, press i for changes, ESC to exit insert mode, “:w” to save, “:q” to close file
python file.py : execute a python file from terminal
Bash file: name.sh
chmod +x “filename”.sh : to make executable
./example.sh :  to run the bash file on terminal


M2 CONDA notes
-----------------------------------------------------------------
conda create --name “name” python=3.9
conda list: gives you a list of the packages installed in the current environment
conda list -n “env_name”: gives you a list of the packages installed in the current environment
conda list --export > environment.txt : export this list to a text file
conda info –envs: list of all the environments that you have created
pip list: list of all pip installed packages inside conda environment 
pip freeze>requirements.txt: export this to a file

M3 PYTHON AND JUPITER FILES
-----------------------------------------------------------------
conda install nbconvert # or pip install nbconvert
(need some further dependencies such as Pandoc, TeX and Pyppeteer for it to work)
jupyter nbconvert --to=script my_notebook.ipynb: converting a notebook to a .py script 