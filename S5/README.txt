M15 UNITTESTING
-----------------------------------------------------------------
Unit testing refer to the practice of writing test that tests individual parts of your code base to test for correctness. 
By unit you can therefore think a function, module or in general any object. 
By writing tests in this way it should be very easy to isolate which part of the code that broke after an update to the code base. 

PYTEST
$ pip install pytest

1. Write some tests.
2. Make sure that they are passing locally.
3. Implement a parametrize test and make sure that it runs for different input.
4. We can measure is the code coverage:  refers to the percentage of your codebase that actually gets run when all your tests are executed. 

$ pip install coverage
$ coverage run -m pytest tests/
$ coverage report -m.  # To get a simple coverage report 


M16 GITHUB ACTIONS
-----------------------------------------------------------------
Github actions are the CI solution that Github provides. 

1. Start by creating a .github folder in the root of your repository.
2. Read: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python
3. Place this file called tests.yml in the .github/workflows/
4. For the script to work you need to define the requirements.txt and requirements_tests.txt. 
5. Finally, try pushing the changes to your repository.
6. The provided tests.yml only runs on one operating system

As the workflow is currently setup, github actions will destroy every downloaded package when the workflow has been executed. 
To improve this we can take advantage of caching:
https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows

As stated in the introduction, ideally we want to only push our code to branches, such that our workflows run before we actually merge code into our codebase. 
We can directly prevent bad behavior by adding branch protection rules to our repository:

On your Github repository of choice, go to Settings -> Branches -> Add branch protection rule:


Auto linter:
we will setup github workflows that will automatically test for good coding practices:
1. Create a new workflow file called isort.yml
2. Create a new workflow file called flake8.yml,
3. Create a new workflow file called mypy.yml
4. Try to make sure that all tests are passing on repository. 

M17 PRE-COMMIT
-----------------------------------------------------------------
Pre-commit hooks can help us attach additional tasks that should be run every time that we do a git commit.

$ pip install pre-commit

$ pre-commit sample-config | out-file .pre-commit-config.yaml -encoding utf8

https://github.com/pre-commit/pre-commit-hooks

Make sure that you also can do commits without running pre-commit:
$ git commit -m <message> --no-verify


M18 CONTINUOUS CONTAINERS
-----------------------------------------------------------------
In this session going to look how we can automatically build and push our docker builds to docker hub. 


1. Start by pushing whatever docker file you want that should be continuously build to your repository
2. Start by creating a Docker Hub account
3. Next, within Docker Hub create an access token by going to Settings -> Security. 
Click the New Access Token button and give it a name that you recognize.
4. Copy the newly created access token and head over to your Github repository online. Go to Settings -> Secrets -> Actions and click the New repository secret.
5. Next we are going to construct the actual Github actions workflow file:

name: Docker Image CI

on:
  push:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Build the Docker image
      run: |
        echo "$" | docker login \
          -u "$" --password-stdin docker.io
        docker build . --file Dockerfile \
          --tag docker.io/$/$:$GITHUB_SHA
        docker push docker.io/$/$:$GITHUB_SHA
6. Upload the workflow to your github repository and check that it is being executed. 
7. Make sure that you can execute docker pull locally to pull down the image that you just continuously build.

M19 CONTINUOUS ML
-----------------------------------------------------------------

Continuous machine learning (CML): we are now focusing on automatizing actual machine learning processes.

1. Create an copy of your training script (call it train_cml.py)
2. Copy the following code into a new workflow (called cml.yaml)
3. Try pushing the workflow file to your github repository and make sure that it completes.
4. Send yourself a pull-request.
5. If you workflow file is executed correctly you should see github-actions commenting with a performance report on your PR.

