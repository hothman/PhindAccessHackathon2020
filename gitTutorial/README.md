# Tutorial on how to use Git 

A bioinformatics project may be very complicated by the different tasks and non linear progress as well as the diversity of data and the involvement of multiple contributors. Some of the problems that can arise from a complex project are the creation of conflicted versions by collaborators and the difficulty to spot bugs and fixing errors in workflows. 

As an example, let's suppose that you built a workflow that counts the proportion of SNPs from high throughput genome data. You have run your workflow and you have found that 16% of the SNPs belong to the coding region. After two months of tuning and building more modules to your workflow, you re-run it again but now you find that 26% of the SNPs belong to the coding region! If you’ve been tracking your project’s development using a version control system like `git`, you’ll have an entire history of all of your project’s changes and can pinpoint when your results changed.

The following tutorial will help you to start using `git` and to understand its fundamental concepts. It is very easy to start using `git` but it make take some time to master all its functionalities. Like everything in the world, regular practice maybe your best choice to reach mastery. 

## Installing `git`

On a Debian Linux distribution you can install git by the following command : 

```
$ apt-get install git
```

## Git Setup

We interact with Git using subcommands in the following format

```sh
$ git <subcommand> 
```

To keep the traceability of your code or any file in the project’s directory, first, we must tell Git who makes the changes.  This is done by providing your name and your email.

```sh
$ git config --global user.name "Hay Ben Yakdhan"
$ git config --global user.email "yakdhan@tales.org"
```

## Creating a `git` repository

Creating a git repository consists of telling  `git` to track a project directory. The tracking unit is called **repository** and it is a directory that contains different files relative to the project. There are two different ways to create a repository. 

### By initialising a repository from scratch 

First, you can start a new project from a created directory. For example, the directory of your project is called `COVID-Tn` in which you have put different data files and scripts and you want make it a git repository.  Assuming that you have a Unix based operating system. 

1. First create the repository of your project

   ```sh
   $ mkdir COVID-Tn
   ```

2. Let's check what lays withing the `COVID-Tn` directory first

   ```sh
   $ ls --all COVID-Tn/
   . ..
   ```

   It makes sens because you haven't added any thing to the directory

3. Now let's initialise the project. 

   ```sh
   $ cd COVID-Tn
   $ git init
   Initialized empty Git repository in /home/username/COVID-Tn/.git/
   ```

4. The prompting message tells you that the repository have been created successfully. Let's now re-check what changes have been effected in the `COVID-Tn` directory.

   ```bash
   $ ls --all 
   .  ..  .git 
   ```

   A hidden directory with name `.git`(The dot prefix is specific for hidden files in Unix, you can verify that by entering `ls` command with no argument) has been created in the directory `COVID-Tn`. Everything related to tracking the changes in your repository is managed by `git`  through the `.git` directory. Evidently, you don't want to delete or change any thing in `.git` otherwise you will corrupt git functionality.

### Initialising a repository from ***cloning***

**Cloning** is copying the content of an existing repository. Typically, repositories are hosted on remote servers (can be your Institute computing facility or a server from a local network). Perhaps cloning is most frequently done from one of the version control web hosting services like [GitHub](https://github.com/), [Bitbucket](https://www.atlassian.com/software/bitbucket/enterprise/data-center) or [GitLab](https://about.gitlab.com/) where an administrator creates a repository and makes it accessible to specific users. This is the case of all the repositories for the *PhindAccess Hackathon*.

Let's practice on the `PhindAccessHackathon2020` repository. 

1. A repository is most often hosted remotely, so the fist step for *cloning* is to get an address to the `PhindAccessHackathon2020` repository that is recognised by `git`. First point your browser to the URL address of the repository on GitHub `https://github.com/hothman/PhindAccessHackathon2020`

2. In the main page click on the button that says *Code*. A message box will pop out . Copy the address.  

3. Open a terminal window and then enter the command 

   ```bash
   $ git clone <adress_to_phinaccesshachathon_repo>  
   ```

4. `git` will then download the content of the repository in your local machine under the directory name  `PhindAccessHackathon2020`

## Tracking files by git 

Now that you have a git repository, you may start to modify its content while keep tracking the modifications that you have made. The upmost directory of the repository hierarchy , i.e. `PhindAccessHackathon2020`. 

1. go to the `gitTutorial` directory

2. `git` enables you to get a summary of all the modifications that have been made in a directory. To do so for `gitTutorial` type the command : 

   ```sh
   $ git status
   ```

3. Now we will add a new file to the `gitTutorial` directory. There are plenty of ways to do that in Unix Os perhaps the easiest is to create an empty file using the `touch` command. The name of the file should be your `name_surname`. Remember, don't use spaces as this is highly non recommended. 

   ```
   $ touch name_surname
   ```

4. The file `name_surname` is now created inside `gitTutorial`. You can check that with `ls` command. 

5. If you run the command `git status` again you will notice that the returned message is different from the previous one. `git` tells you that a file has been added. By default `git` does not track the changing automatically, so you have to tell it to do start tracking the file `name_surname` that you have created earlier. 

   ```sh
   $ git add name_surname
   ```

6. If you type `git status` again, it will tell you that the `name_surname` file is now tracked by git. 

At some level you would have to track multiple files at once or all the files in one directory. Using the wild card feature can save you a lot of time by avoid tracking the files one by one. The following command add all the files in a directory to the tracking system.

```sh
$ git status *
```

## Staging 

Along the project you will made modifications to the content of the tracked files. Changes made to a tracked file will not automatically be recorded by `git`. Think about staging as preparing for recording the changes. It’s important to be aware that any modifications made to a file since the last time it
was staged will not be included in the next 'recording' of the modifications unless they are staged. This extra step may seem like an inconvenience but actually has many benefits.

1.  `git status`  will tell you that a new file `name_surname` is currently tracked

   ```
   On branch master
   Your branch is ahead of 'origin/master' by 2 commits.
     (use "git push" to publish your local commits)
   
   Changes to be committed:
     (use "git reset HEAD <file>..." to unstage)
   
   	new file:   name_surname
   
   Changes not staged for commit:
     (use "git add/rm <file>..." to update what will be committed)
     (use "git checkout -- <file>..." to discard changes in working directory)
   ```

   

2.  Open the `name_surname` file and add a phrase of your favourite quote. Mine is, *In God we trust. all others bring data* then save the file.

3. You now realise the importance of the `git status` command. If you use it again `git`will tell you that the file `name_surname` has been modified but it is still not staged. 

   ```
   On branch master
   Your branch is ahead of 'origin/master' by 2 commits.
     (use "git push" to publish your local commits)
   
   Changes to be committed:
     (use "git reset HEAD <file>..." to unstage)
   
   	new file:   jhon_snow
   
   Changes not staged for commit:
     (use "git add/rm <file>..." to update what will be committed)
     (use "git checkout -- <file>..." to discard changes in working directory)
   
   	modified:   name_surname
   
   ```

   So If we want to record what modifications we have made in the `name_surname` file, as we will see in the next section, you would not be able to do that since the `name_surname` file is not yet staged. Luckily you don't have to use anything special to make the staging of the `name_surname` file. Simply you can use the previous command

```sh
$ git add name_surname
```

4. Use `git status` and you will notice that no file has to be staged. 

## Committing

We kept talking in the last paragraph about "recording the modifications". This is a very superficial equivalent to what we call ***Committing*** in `git` and it is the fundamental unit of change in `git`. In other words, a repository state, is described by the series of committed modifications that have been made starting from the first time it was created. A commit is like taking is snapshot of your entire project.

Committing your staged modifications is quite easy and it is made by the following command. You only thing that you have to provide is a descriptive message that summarises the modifications that you have made in the staging process. 

```bash
$ git commit -m "Adding the file name_surname, and fill it with my favorite quote"
```

Ideally commits should reflect relevant snapshots of the project. You don't want to commit every single line of a code. Equally, you don't want to commit a staging that include your work of the last two months. Both practices well make it difficult to you to distinguish relevant modifications in the repository. 

A list of commits that have been made can be find in the log file and you can navigate through them using the following command: 

```sh
$ git log 
commit aca62abafff5b3640ae88fe744a3e583bf8e4294
Author: hothman <houcemoo@gmail.com>
Date:   Sun Aug 23 12:46:20 2020 +0200

   Adding the file name_surname, and fill it with my favorite quote

```

The most recent commit is found at the top of the log.  The strange looking number is called the SHA-1 checksum and it is a unique identifier for each commit.  Information regarding the author of the commit, the time and date, as well as the committing message are given. 

## Collaborating with Git

When you work with different collaborators, you often share a remote repository hosted elsewhere. This could be on GitHub, Bitbucket or you institute server. You may modify the working repository at different stages of the workflow. Therefore, you need to update the shared repository with the modifications that you have made and some times, you need to update your local copy of the project repository with the modifications made by the other users. These two operations are respectively called **pushing** and **pulling**. 

### Pushing to a Git remote repository

If you have cloned the repository `PhindAccessHackathon2020` and made the modifications described earlier in the previous sections, then you would be able to push the `name_surname` file containing your favourable quote to the remote repository on GitHub. To do so you can use git as follows: 

```
git push <remote-name> <branch>
```

Branches in Git are snapshots of the repository for which the developing line has been deviated from the original branch. branches can be created independently from the main branch which is the master. To get the list of the branches, you can enter the following command: 

```sh
$ git branch
* master
```

The output message tells you that we have only the `master` branch. 

Remote repositories are versions of your project that are hosted on the Internet or network somewhere. You can access the list of remote names as follows 

```sh
$ git remote 
origin
```

It makes sens because we have one central copy of the project hosted in GitHub. 

To wrap it all, we can make the pushing to the `master` branch to the repository at the remote name `origin`

```sh
$ git push origin master
Username for 'https://github.com': hothman
Password for 'https://hothman@github.com': 
Counting objects: 11, done.
Delta compression using up to 12 threads.
Compressing objects: 100% (9/9), done.
Writing objects: 100% (11/11), 5.31 KiB | 1.06 MiB/s, done.
Total 11 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 1 local object.
To https://github.com/hothman/PhindAccessHackathon2020.git
   aed7d13..40b245c  master -> master

```

You will be able to check if the push is successful by looking to the updated repository in GitHub by clicking on the commits button and check if your committing message is there. 

### Pulling from a Git remote repository

Pulling from the remote repository will enable you to include the modifications made by your collaborators in your local repository. It can also be done in the same fashion of pushing. 

```sh
$ git pull origin master
From https://github.com/hothman/PhindAccessHackathon2020
 * branch            master     -> FETCH_HEAD
Already up to date.
```

I am getting this message because no one is modifying the content `PhindAccessHackathon2020` as I write this tutorial. 

### Managing conflicts in Git

Conflicts occur when for example two users that made a pull from the same repository snapshot, modify the same content of a file differently. Then only the first one to make the push to the remote repository will succeed and the second user will get a merge conflict message. 

Lets suppose user-1 and 2 made the pulling of the same snapshot of the remote repository. The original content of a file called ``poem.txt` is the following.

```
--- By Jalalouddine al Rumi---
If you are irritated by every rub 
how will you ever get polished
```

 The first user made the modifications of the file `poem.txt` by inserting two verses and made the commit and push to the remote repository before user-2.

```
--- By Jalalouddine al Rumi---
If you are irritated by every rub 
how will you ever get polished
Every moment I shape my destiny with a chisel
I am a carpenter of my own soul
```

User-2 modify `poem.txt` differently 

```
--- By Jalalouddine al Rumi---
If you are irritated by every rub 
how will you ever get polished
Beauty unveils His exquisite form
in the solitude of nothingness
```

You notice that the verses 3 and 4 in the file are not the same between the two users. User-1 can successfully make the commit but when he wants to push to the remote repository he will get the following message. 

```sh
$ git push origin master
To https://github.com/hothman/PhindAccessHackathon2020.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/hothman/PhindAccessHackathon2020.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Git cannot make the push because the snapshot in user-2 repository is no longer the same as the remote repository since user-1 already made a push. In this message, git simply asks user-2 to pull the new updates from the remote repository. 

```sh
$ git pull origin master
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 4 (delta 1), reused 4 (delta 1), pack-reused 0
Unpacking objects: 100% (4/4), done.
From https://github.com/hothman/PhindAccessHackathon2020
   81cc8a5..ff8218d  master     -> origin/master
Auto-merging gitTutorial/poem.txt
CONFLICT (content): Merge conflict in gitTutorial/poem.txt
Automatic merge failed; fix conflicts and then commit the result.
```

The returned message implies that Git is not able to push the modifications of user-2 because of the conflict with the current snapshot of the remote repository. 

There aren't really golden rules to manage conflicts in a git repository. At the basic level, resolving the conflict can be summarised in these four steps. 

1. Use `git status` to find the conflicting file(s).
2. Open and edit those files manually to a version that fixes the conflict.
3. Use git add to tell Git that you’ve resolved the conflict in a particular file.
4. Once all conflicts are resolved, use `git status` to check that all changes are staged. Then, commit the resolved versions of the conflicting file(s). It’s also wise to immediately push this merge commit, so your collaborators see that you’ve resolved a conflict and can continue their work on this new version accordingly.

Let's apply this in our example: 

1. First we apply `git status`

   ```sh
   $ git status 
   On branch master
   Your branch and 'origin/master' have diverged,
   and have 1 and 1 different commits each, respectively.
     (use "git pull" to merge the remote branch into yours)
   
   You have unmerged paths.
     (fix conflicts and run "git commit")
     (use "git merge --abort" to abort the merge)
   
   Unmerged paths:
     (use "git add <file>..." to mark resolution)
   
   	both modified:   poem.txt
   
   no changes added to commit (use "git add" and/or "git commit -a")
   ```

   The output message point out to a conflict in the file `poem.txt` . The type of the conflict indicated by `both modified` shows that there are two different instances of `poem.txt` . Noting that there are other types of conflicts like `both deleted`, `both added` and `added by them`. 

2. If we take a look to the `poem.txt` file we will see that git added some indicators for you to spot the conflicting lines after you have made the last pull. The following content is what we would get if we open the file in a text editor.

   ```
   --- By Jalalouddine al Rumi---
   If you are irritated by every rub 
   how will you ever get polished
   <<<<<<< HEAD
   Every moment I shape my destiny with a chisel
   I am a carpenter of my own soul
   =======
   Beauty unveils His exquisite form
   in the solitude of nothingness
   >>>>>>> ff8218d912c006f6fd0b81ca1a4a5c4182fabc19
   ```

   `Head` indicates the starting of our version

   `=======` Indicates the end of HEAD and beginning of user-1 changes.

   `>>>>>>>` Indicates the end of HEAD of user-1 version and the corresponding SHA-1 checksum number to his commit.

3. What you have to do is to manage the conflict in these lines. You can decide by yourself or you can discuss that with your collaborator to understand the reasons of his modifications and yours and come to an agreement. In our case we decided to put all the verses of the poem such in this way: 

   ```
   --- By Jalalouddine al Rumi---
   If you are irritated by every rub
   how will you ever get polished
   Every moment I shape my destiny with a chisel
   I am a carpenter of my own soul
   Beauty unveils His exquisite form
   in the solitude of nothingness
   ```

   Once we do that, we stage the modifications using `git add poem.txt`

4. The last step is to commit the modifications and push to the remote repository. But first, we can make sure that we have solved all the conflicts using `git status`

   ```sh
   $ git status
   On branch master
   Your branch and 'origin/master' have diverged,
   and have 1 and 1 different commits each, respectively.
     (use "git pull" to merge the remote branch into yours)
   
   All conflicts fixed but you are still merging.
     (use "git commit" to conclude merge)
   
   Changes to be committed:
   
   	modified:   poem.txt
   ```

   Everything is sorted out and you can see that from the message `All conflicts fixed but you are still merging.` 

   Now we can commit and push to the remote repository. 

   ```sh
   $ git commit -m "Solving conflict in poem.txt"
   git push origin master
   ```

   

 ## Summary

* It is better to create a single directory that contains all the files related to a project.
* You can start tracking the modifications made in a project directory using Git. To do so, you can initialise the tracking sing `git init` command from the highest folder in the hierarchy of the project or by cloning a previously created project from a remote repository using `git clone <adress to the remote repository>.`
* `git status` helps you to check the tracking of your repository. 
* A commit is the unit of tracking using a version control system. 
* A commit can be achieved by three steps: modifying (can use any operation or tools applied on file(s)), staging (`git add <your modified file(s)>`) and committing (`git commit -m "A message to summarise the commit"`)
* You can upload your modifications to a remote repository with `git push`
* You can update your local repository with `git pull`
* Managing the conflicts can be made in four steps. It is primarily based on manual intervention. 

  

