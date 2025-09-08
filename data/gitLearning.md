<!-- # Git Learning -->

Command | description
------- | --------
**`0. Basic Git Info`**|
`git --version` or `git -v` | Check Git Version
`git --help` or `git -h` | Git help for basic command
**`1. download/Clone code from cloud`** | 
`git clone <clone_url>` | download code from cloud using git
`git clone <clone_url> <new_repo_name>`| download git repo with custom name
**`2. Check your branch Name`** |
`git branch` | check your local branches name
`git branch -r` | List all remote branches of the current Git
`git branch -a` |  check your local & global branches name
**`3. Pull Your changes`** |
`git fetch origin` | Get all the change history of the origin in your branch
`git pull origin` <br> or <br> `git pull`|Update the current branch from its origin using a single command
**`4. switch to another branch`** | 
`git checkout <branch_name>` | switch to another branch	<br> if it's available into your machine 	 
`git checkout <commit_id> -b <branch_name>` | create a new branch with a specific commit id and switch that branch<br>do it after clone from `master` branch
**`5. Git add your changes in cloud`** | 
`git status` | Check your local changes
`git add .` | add your all changes	 	 
`git commit -m "<enter_message>"` | add your commit message 	 	 
`git push origin master` | push at your original branch
`git commit -am "<enter_message>"`| add your existing files changes & commit in a single time
`git add <filePath_with_Name_01>` | add your changes for particular file(s)
`git push --set-upstream origin <branch_name>` | Create a new branch in remote repository and committed changes push into that branch. 
**`6. Rename & Delete your branch`** | 
`git branch -m <new_branch_name>` | rename a branch<br>Stay outside of this branch
`git branch -d <delete_branch_name>` <br>or<br> `git branch -D <delete_branch_name>` | delete local branch<br>Stay outside of this branch
`git remote rename origin <new_branch_name>` | Rename the origin remote to new_branch_name  
`git remote prune origin` <br>or<br> `git fetch --prune`| Remove all deleted branches from remote
**`7. Revert, Reset or Clean your changes or directory`** | 
`git revert HEAD && git push` | revert the last changes
`git revert HEAD --no-edit && git push` | revert the latest commit
`git revert HEAD~1` | revert last two commits
`git reset` | discard local change 	 
`git reset --hard` | discard everything permanently<br>not delete new creating file
`git reset --<filePath_with_Name_01>` <br>or<br> `git restore <filePath_with_Name_01>` | Reset particular file(s) 
`git clean -dfx` | clean your directory like | cloud branch<br>Please go to master branch & do it
`git rm <filePath with fileName>` | remove particular file from existing directory
**`8. Reset a single file`**|
`git checkout @ -- <file_name>.<ext_name>` | reset changes with in file <file_name.ext_name>
**`9. git configuration`** | 
`git config --list` | Show all Git Configuration
`git config --global user.name` <br>`git config --global user.email` | Show git config user info
`git config --global user.name "<new User name>"` <br> `git config --global user.email "<new User mail>"` | Update git config user info
`git config --global --unset user.name` <br> `git config --global --unset user.email` | Reset git config user info
`git config --global --edit` | Edit git config
**`10. get merge branch`**|
`git merge <other_branch_name>` | merge current branch with branch: 'other_branch_name'
`git merge origin/master`|Merge the current branch with the branch master, on origin
**`11. Patch Creating & apply`** | 
`git diff` | check all of your local changes<br>If your add new Folder then don't show here
`git diff --name-only` | show list of your local changes file name
`git diff > <patch_fileName>.patch` | store difference into a folder
`git diff <fileName_including_path>` > `<patch_fileName>.patch` | create patch file on a specific changes file<br>first run `git diff --name-only` and copy `fileName_including_path`
`git apply <patch_fileName>.patch` <br> `git apply <patch_directory_path>/<patch_file>.patch` | apply patch file
**`12. git logs`**|
`git log --online` | Show the log of the repository
`git log -n 1` | Check last commit History
**`13. git rename directory & file`**|
`git mv <old_name> <new_name>` | Rename Directory/File Name (If directory/File Name is different)
`git mv <OLD_name> temp` <br> `git mv temp <old_name>`| Case-Sensitive Directory/File Name
**`14. git Proxy Settings`**|
`git config --global http.proxy`| View `HTTP` proxy config
`git config --global https.proxy`| View `HTTPS` proxy config
`git config --global http.proxy http://proxyUsername:proxyPassword@proxyServerName:port` <br> `git config --global http.proxy http://proxyUsername@proxyServerName:port`| Set `HTTP` proxy
`git config --global https.proxy https://proxyUsername:proxyPassword@proxyServerName:port` <br> `git config --global https.proxy http://proxyUsername@proxyServerName:port`| Set `HTTPS` proxy
`git config -–global –-unset http.proxy`| Unset `HTTP` proxy
`git config -–global –-unset https.proxy`| Unset `HTTPS` proxy

	 	 
<!-- 
## Main Porcelain Commands
Command type | description
------- | --------
add                  | Add file contents to the index   
am                   | Apply a series of patches from a mailbox   
archive              | Create an archive of files from a named tree   
bisect               | Use binary search to find the commit that introduced a bug   
branch               | List, create, or delete branches   
bundle               | Move objects and refs by archive   
checkout             | Switch branches or restore working tree files   
cherry-pick          | Apply the changes introduced by some existing commits   
citool               | Graphical alternative to git-commit   
clean                | Remove untracked files from the working tree   
clone                | Clone a repository into a new directory   
commit               | Record changes to the repository   
describe             | Give an object a human readable name based on an available ref   
diff                 | Show changes between commits, commit and working tree, etc   
fetch                | Download objects and refs from another repository   
format-patch         | Prepare patches for e-mail submission   
gc                   | Cleanup unnecessary files and optimize the local repository   
gitk                 | The git repository browser   
grep                 | Print lines matching a pattern   
gui                  | A portable graphical interface to git   
init                 | Create an empty git repository or reinitialize an existing one   
log                  | Show commit logs   
merge                | Join two or more development histories together   
mv                   | Move or rename a file, a directory, or a symlink   
notes                | Add or inspect object notes   
pull                 | Fetch from and integrate with another repository or a local branch   
push                 | Update remote refs along with associated objects    
range-diff           | Compare two commit ranges (e.g. two versions of a branch)    
rebase               | Reapply commits on top of another base tip    
reset                | Reset current HEAD to the specified state    
revert               | Revert some existing commits    
rm                   | Remove files from the working tree and from the index   
shortlog             | Summarize 'git log' output    
show                 | Show various types of objects   
stash                | Stash the changes in a dirty working directory away    
status               | Show the working tree status    
submodule            | Initialize, update or inspect submodules    
tag                  | Create, list, delete or verify a tag object signed with GPG    
worktree             | Manage multiple working trees  Ancillary Commands / Manipulators    
config               | Get and set repository or global options    
fast-export          | git data exporter    fast-import          Backend for fast git data importers    
filter-branch        | Rewrite branches   
mergetool            | Run merge conflict resolution tools to resolve merge conflicts    
pack-refs            | Pack heads and tags for efficient repository access    
prune                | Prune all unreachable objects from the object database    
reflog               | Manage reflog information    
remote               | Manage set of tracked repositories    
repack               | Pack unpacked objects in a repository    
replace              | Create, list, delete refs to replace objects  Ancillary Commands / Interrogators    
annotate             | Annotate file lines with commit information    
blame                | Show what revision and author last modified each line of a file    
count-objects        | Count unpacked number of objects and their disk consumption    
difftool             | Show changes using common diff tools    
fsck                 | Verifies the connectivity and validity of the objects in the database    
gitweb               | git web interface (web frontend to git repositories)    
help                 | Display help information about git   
instaweb             | Instantly browse your working repository in gitweb    
merge-tree           | Show three-way merge without touching index    
rerere               | Reuse recorded resolution of conflicted merges    
show-branch          | Show branches and their commits    
verify-commit        | Check the GPG signature of commits    
verify-tag           | Check the GPG signature of tags    
whatchanged          | Show logs with difference each commit introduces  Interacting with Others    
archimport           | Import a GNU Arch repository into git    
cvsexportcommit      | Export a single commit to a CVS checkout    
cvsimport            | Salvage your data out of another SCM people love to hate    
cvsserver            | A CVS server emulator for git    
imap-send            | Send a collection of patches from stdin to an IMAP folder    
p4                   | Import from and submit to Perforce repositories    
quiltimport          | Applies a quilt patchset onto the current branch    
request-pull         | Generates a summary of pending changes    
send-email           | Send a collection of patches as emails    
svn                  | Bidirectional operation between a Subversion repository and git  Low-level Commands / Manipulators    
apply                | Apply a patch to files and/or to the index    
checkout-index       | Copy files from the index to the working tree    
commit-graph         | Write and verify git commit-graph files    
commit-tree          | Create a new commit object    
hash-object          | Compute object ID and optionally creates a blob from a file    
index-pack           | Build pack index file for an existing packed archive    
merge-file           | Run a three-way file merge    
merge-index          | Run a merge for files needing merging    
mktag                | Creates a tag object    
mktree               | Build a tree-object from ls-tree formatted text    
multi-pack-index     | Write and verify multi-pack-indexes    
pack-objects         | Create a packed archive of objects    
prune-packed         | Remove extra objects that are already in pack files    
read-tree            | Reads tree information into the index    
symbolic-ref         | Read, modify and delete symbolic refs    
unpack-objects       | Unpack objects from a packed archive    
update-index         | Register file contents in the working tree to the index    
update-ref           | Update the object name stored in a ref safely    
write-tree           | Create a tree object from the current index  Low-level Commands / Interrogators    
cat-file             | Provide content or type and size information for repository objects    
cherry               | Find commits yet to be applied to upstream    
diff-files           | Compares files in the working tree and the index    
diff-index           | Compare a tree to the working tree or index    
diff-tree            | Compares the content and mode of blobs found via two tree objects    
for-each-ref         | Output information on each ref    
get-tar-commit-id    | Extract commit ID from an archive created using git-archive    
ls-files             | Show information about files in the index and the working tree    
ls-remote            | List references in a remote repository    
ls-tree              | List the contents of a tree object    
merge-base           | Find as good common ancestors as possible for a merge    
name-rev             | Find symbolic names for given revs    
pack-redundant       | Find redundant pack files    rev-list            
Lists commit objects | in reverse chronological order   
rev-parse            | Pick out and massage parameters   
show-index           | Show packed archive index   
show-ref             | List references in a local repository   
unpack-file          | Creates a temporary file with a blob's contents   
var                  | Show a git logical variable   
verify-pack          | Validate packed git archive files  Low-level Commands / Synching Repositories    
daemon               | A really simple server for git repositories   
fetch-pack           | Receive missing objects from another repository    
http-backend         | Server side implementation of git over HTTP    
send-pack            | Push objects over git protocol to another repository    
update-server-info   | Update auxiliary info file to help dumb servers  Low-level Commands / Internal Helpers    
check-attr           | Display gitattributes information    
check-ignore         | Debug gitignore / exclude files    
check-mailmap        | Show canonical names and email addresses of contacts    
check-ref-format     | Ensures that a reference name is well formed    
column               | Display data in columns    
credential           | Retrieve and store user credentials    
credential-store     | Helper to store credentials on disk    
fmt-merge-msg        | Produce a merge commit message    
interpret-trailers   | Add or parse structured information in commit messages    
mailinfo             | Extracts patch and authorship from a single e-mail message    
mailsplit            | Simple UNIX mbox splitter program    
merge-one-file       | The standard helper program to use with git-merge-index    
patch-id             | Compute unique ID for a patch    
sh-i18n              | git's i18n setup code for shell scripts    
sh-setup             | Common git shell script setup code    
stripspace           | Remove unnecessary whitespace  External commands    
askyesno    | credential-helper-selector    
flow    | lfs


Helping Link: 

https://alvinalexander.com/git/git-show-change-username-email-address 

```
> git status -z -u 

> git symbolic-ref --short HEAD 

> git rev-parse bugs/697123 

> git rev-parse --symbolic-full-name [ bugs/697123@{u}] 

fatal: no upstream configured for branch 'bugs/697123' 

> git for-each-ref --format %(refname) %(objectname) --sort -committerdate 

 
Untitled Section

Help: 	https://guide.freecodecamp.org/git/ 
Help1: 	https://git-scm.com/docs/git

``` -->
