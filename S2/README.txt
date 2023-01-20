M5 GIT
-----------------------------------------------------------------
Git add: move from working directory to staging area
Git commit: move from staging area to local repository
Git push: move from local repository to Remote
Git revert/reset: move backwards 1 step
Git restore: move backwards from staging area to working directory

git status: to check in which branch is a repository

branches: each branch can contain code that are not present on other branches.
git checkout -b <my_branch_name>: creating a new branch
git branch: 
git checkout: to change between branches

fork the project: create a local copy of the repository which you have complete writing access to


M6 CODE STRUCTURE
-----------------------------------------------------------------
cookie-cutter approach: https://drivendata.github.io/cookiecutter-data-science/
How to create a cookie cutter structure:
1. Choose in the terminal the folder where you want to create the structure
2. $ pip install cookiecutter
3. $ cookiecutter -c v1 https://github.com/drivendata/cookiecutter-data-science
4. fill in all the requirements: names, description, licence (1),...
5. Push to github repository

6. Install the project as a package in our conda environment.
open in the conda environtment terminal the project folder and do:
$ pip install -e .
$ pip install -r requirements.txt : to install additional packages required by cookie-cutter.

M7 GOOD CODING PRACTICE
-----------------------------------------------------------------
1. Documentation: well documented code is easier to maintain
“Code tells you how; Comments tell you why.”
https://www.programiz.com/python-programming/docstrings

Docstrings: are the string literals that appear right after the definition of a function, method, class, or module. 
''' multiple-line comment'''
print(function.__doc__) : docstrings are associated with the object as their __doc__ attribute

def add_binary(a, b):
    '''
    Returns the sum of two decimal numbers in binary digits.

            Parameters:
                    a (int): A decimal integer
                    b (int): Another decimal integer

            Returns:
                    binary_sum (str): Binary string of the sum of a and b
    '''
    binary_sum = bin(a+b)[2:]
    return binary_sum

2. Styling
PEP 8: official style guide for python https://peps.python.org/pep-0008/
Inside your project folder in the coda env:
$ pip install flake8
$ flake8 . #run flake8 on your project

There are some code formatter, that will automatically format your code for you to be pep8 compliant
black: https://github.com/psf/black

$ pip install black
$ black folder/  #to run black in a source file or directory

The recommended line length in pep8 is 79 characters, which by many is considered very restrictive. 
If we wanted tell flake8 and black to only error and correct code with a line length above 100 we could run the following commands
$ flake8 . --max-line-length 100
$ black . --line-length 100

Install isort the standard for sorting imports
$ pip install isort
$ isort .

When you run flake8 it will automatically look for a setup.cfg file in the current folder 
and apply those configs. 

3. Typing 
https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html
You can directly read from the code what the expected types of input arguments and returns are. 
In python the : character have been reserved for type hints. Here is one example of adding typing to a function:

from torch import Tensor  # note it is Tensor with upper case T. This is the base class of all tensors
from typing import Union
def add2(x: Union[int, float, Tensor], y: Union[int, float, Tensor]) -> Union[int, float, Tensor]:
   return x+y

(python > 3.10)
from torch import Tensor  # note it is Tensor with upper case T. This is the base class of all tensors
def add2(x: int | float | Tensor, y: int | float | Tensor) -> int | float | Tensor:
   return x+y

from typing import Any
def add2(x: Any, y: Any) -> Any:
   return x+y

mypy is what is called a static type checker. 
$ pip install mypy
$ mypy typing_exercise.py


M8 DATA VERSION CONTROL DVC
-----------------------------------------------------------------
DVC (Data Version Control) is simply an extension of git to not only take versioning data but also models and experiments in general. 
But how does it deal with these large data files? Essentially, dvc will just keep track of a small metafile that will then point to some remote location where you original data is store. 
We now have two remote locations: one for code and one for data. 
- git pull/push for the code
- dvc pull/push for the data. 

$ pip install dvc
$ pip install "dvc[gdrive]"