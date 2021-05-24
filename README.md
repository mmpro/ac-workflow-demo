# Project Preparation
1. Create Project on Jenkins, create a token
2. Create local .jenkins file with your Jenkins credentials and the product info
TBC

### Jenkins User/Token
Create a token for your user and use it in .jenkins.conf file

# Workflows

## Developer Workflow
1. Pull *develop* branch
2. Create your working/feature branch from *develop* branch
3. Commit your changes on that working branch - use ac-semantic-release (make commit)
4. If you have prepared all changes, rebase them with *develop* branch and fix all conflicts
5. Create a Pull Request using ./node_modules/ac-jenkins/bin/createpr.sh (Make file)

## Automatic workflow
1. The pull request is created and set to draft
2. Tests are started
3. If tests are successfull, the reviewer is set (TODO)
4. The Pull Request is marked ready

## Reviever/Approval workflow
1. Review online
2. Start Jenkins project AC-Github-PR-Release
3. Done


# Installation
Install Github CLI (gh)


# TODO
+ what if tests fail
+ select reviewer
+ handle misc errors