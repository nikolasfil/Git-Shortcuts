# Git Shortcuts

For Linux, with git installed 

### Installation:

Source the two file in the bash.bashrc file: 

```bash
source <absolute path>/gclone_function.sh ;
source <absolute path>/git_functions.sh ;
```


---


### Usage:


---

> **gclone** 
> Works with ssh cloning 

```bash
gclone git@github.com:<username>/<repository>.git 

or 

gclone <username>/<repository>.git 
```

It will automatically discern which one out of the two options you have used and clone the repository, and then it will cd into it 


---

> gall 
> Adds everything in the current working folder and commits with the message given
> The message does not need quotes 

```bash
gall This is an update 
```


>gadd 
>adds everything in the current working directory 


>gadl 
>adds everything 


>gco 
>commits with the words parsed as commit message 


```bash
gadd
gadl
gco this is another commit message 
```


>gps 
>git push 


>gst 
>git status


>gcdu 
>With an absolute path as parsing argument, it will automatically go to the folder, add everything, commit with the current time and date and push 
>It will also let the user know of the progress, with messages in the terminal or with notify-send
>It checks and puts files over 100mb to gitignore 
>It checks if there are any changes to be committed 
>It fetches the latest changes from the remote repository, and pulls them if the branch is behind 


```bash 
gcdu <path>/<git project>
```



