# Back to original base version

Assume you are working on your local fork where you have made some changes but need to base version of the repository because 
you want to make a PR unrelated to you current work. You will need to make a new branch based on the origin and make the changes
here so you can make an individual PR.

``` bash
# this creates the branch "old-state" in your local fork which is based on commit id "0d1d7fc32"
git checkout -b old-state 0d1d7fc32
# push it to your fork on github
git push --set-upstream origin old-state
```

Ref:  
https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit

# Delete remote/local branch e.g. on github

``` bash
# remote
git push origin --delete branch_name
# local
git branch -d branch_name
```

Ref:  
https://makandracards.com/makandra/621-git-delete-a-branch-local-or-remote

# Merge upstream repo into your fork

Ref:  
https://help.github.com/en/articles/merging-an-upstream-repository-into-your-fork


