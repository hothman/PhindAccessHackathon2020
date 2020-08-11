# Hackathon 2020 

## Goals  

* To develop open source bioinformatics tools to help in genome data preparation, management and analysis of SARS-CoV-2 and host genomes. 
* To help you in assimilating the different concepts that you have already developed during the last PHAINDACCESS courses. 
* To create a sustainable community within IPT that helps in designing and developing of bioinformatics tools. 

The most important outcome from this hackathon is to help you learn new skills and that depends on the interactivity level between the different members. 

## Requirements

There is no prior requirement for you to be part in the hackathon. Although, participants are encouraged to shape their knowledge in [LINUX](https://www.tutorialspoint.com/unix/index.htm), [Nextflow](https://www.nextflow.io/), [Git](https://git-scm.com/), [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html), [Python](https://www.python.org/downloads/) and [R](https://www.r-project.org/).  

## Preparing for the hackathon 

### Software and computer environment

#### LINUX

All the tools and software operate in Unix or Unix-like operating system. You need to be confident with the command line tool to explore the file-system, create, displace, and filer files and directories.

#### GitHub

All the files and resources of this project are hosted in a GitHub repository. First of all you need to have a [GitHub](https://github.com/) account so that you can access the resources of the project. Once you created the account, send the ID to `houcemoo@gmail.com`

#### Conda package management system

We are using conda to manage the computational environment used for this hackathon. In other word, conda is used to make sure that every software pr tool used in the hackathon are the same for each participant. 

It is advised to use Anaconda version of conda. It will come already with an extensive set of computational tools including python, pandas, jupyter-notebook and others. 

To install Anaconda:

```
wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
bash Anaconda3-2020.07-Linux-x86_64.sh
```

1. The installer prompts “In order to continue the installation process, please review the license agreement.” Click Enter to view license terms.
2. Scroll to the bottom of the license terms and enter “Yes” to agree.
3. The installer prompts you to click Enter to accept the default install location, CTRL-C to cancel the installation, or specify an alternate installation directory. If you accept the default install location, the installer displays `PREFIX=/home/<user>/anaconda3` and continues the installation. It may take a few minutes to complete.
4. The installer prompts “Do you wish the installer to initialize Anaconda3 by running conda init?” reply by “yes”.

Finally, restart the terminal and you will get something similar to this 

```
(base) user@computername:~$
```

Conda channels are the locations where packages are stored. They serve as the base for hosting and managing packages. Conda [packages](https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/packages.html) are downloaded from remote channels, which are URLs to directories containing conda packages.

Because we are working with bioinformatics tools, we need to add the `bioconda` channel to let conda know where to fetch the dependencies that we want to install

```sh
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
```



#### Installing Nextflow 

In order to run the workflow you need to install Nextflow. First make sure you have java.

```
$ java -version  
```

If you get something like this then java is installed. 

```
openjdk version "11.0.7" 2020-04-14
OpenJDK Runtime Environment (build 11.0.7+10-post-Ubuntu-2ubuntu218.04)
OpenJDK 64-Bit Server VM (build 11.0.7+10-post-Ubuntu-2ubuntu218.04, mixed mode, sharing)
```

Then install Nextflow 

```
curl -s https://get.nextflow.io | bash
```

You can then run the hello world workflow to test the installation

```
./nextflow run hello
```

If the installation works well you would get something like the following

```
Hola world!
Bonjour world!
Ciao world!

Completed at: 27-Apr-2020 22:09:42
Duration    : 478ms
CPU hours   : (a few seconds)
Succeeded   : 4
```

A tutorial is available to introduce you to Nextflow at this link https://github.com/shaze/nextflow-course



### Working with virtual environment 

A virtual environment can help you in tracing the different dependencies with which you are going to develop the workflow of interest. Later, it would be very easy to reproduce the same environment on another machine or share the building breaks of your workflow with other persons. The `conda` tool and the `bioconda` channel will be employed within each virtual environment to install whatever tools you want to install without going over the system wide installation and the tedious compilation procedures. 

Let's day you are working on project 3 of the hackathon. You want to create a virtual environment called `interactomeCoV2020`

```sh
(base) user@computername:$ conda create --name interactomeCoV2020 
```

Then, you want to work within that environment  

```sh
(base) user@computername:$ conda activate interactomeCoV2020 
```

You will then get the following prompt 

```
(interactomeCoV2020) user@computername:$
```

Let's assume that you want to test two aligners in your workflow, `bwa` and `star`

To install them within the `interactomeCoV2020` you will only need to enter the following command

```
conda install -c bioconda bwa star
```



