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
$ git config --global user.email "byakdhan@tales.org"
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
   .  ..  .git Bitbucket
   ```

   A hidden directory with name `.git`(The dot prefix is specific for hidden files in Unix, you can verify that by entering `ls` command with no argument) has been created in the directory `COVID-Tn`. Everything related to tracking the changes in your repository is managed by `git`  through the `.git` directory. Evidently, you don't want to delete or change any thing in `.git` otherwise you will corrupt git functionality.

### Initialising a repository from ***cloning***

**Cloning** is copying the content of an existing repository. Typically, repositories are hosted on remote servers (can be your Institute computing facility or a server from a local network). Perhaps cloning is most frequently done from one of the version control web hosting services like [GitHub](https://github.com/), [Bitbucket](https://www.atlassian.com/software/bitbucket/enterprise/data-center) or [GitLab](https://about.gitlab.com/) where an administrator creates a repository and makes it accessible to specific users. This is the case of all the repositories for the *PhindAccess Hackathon*.

Let's practice on one of the projects repository that are hosted on Github. 



