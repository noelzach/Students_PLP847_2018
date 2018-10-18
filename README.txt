--------------------------------------------
********************************************
***  Homework for Tuesday Oct 23rd 2018  ***
********************************************
-------------------------------------------
***         Gian M N Benucci, Ph.D.      ***
***     Michigan State University        ***
***         benucci<at>msu.edu           ***
--------------------------------------------

Login into HPCC and then into one of the dev nodes

# for example the development node intel18
`[benucci@gateway-03 ~]$ ssh dev-intel18`

# in your home/ create a folder called miseq_students_2018/

`[benucci@dev-intel18 ~]$ mkdir miseq_students_2018/`

and enter inside it

`[benucci@dev-intel18 ~]$ cd miseq_students_2018/`

# Please download and upload the entire folder homework/ into the newly 
# created student_miseq_2018/ you can use command line script or Filezilla 
# (recommended) to do so. List the content!

`[benucci@dev-intel14 miseq_students_2018]$ cd homework/`
`[benucci@dev-intel18 homework]$ ll`

# you shold see something like this

`total 20`
`drwxr-x--- 2 benucci psm   3 Oct 17 21:12 raw_reads`
`-rw-r----- 1 benucci psm 443 Oct 17 21:09 README.txt`
`-rw-r----- 1 benucci psm 981 Oct 16 15:25 test.sb`

# explore the folder and  files using cd, ll, ls, cat, head, tail ...
# if you need help for how to use a command use man <commandname> or
# <commandname> --help,  for example

`[benucci@dev-intel18 homework]$ ll --help`

# Now you are ready to test the environment and see if you can perform
# some analyses into your HPCC account. Look at the script called test.sb 

`[benucci@dev-intel18 homework]$ cat test.sb`

# You will have something like this

------------- start code ---------------
`#!/bin/bash -login`

`#SBATCH --time=00:10:00			# limit of wall clock time - how long the job will run (same as -t)`
`#SBATCH --ntasks=1			# number of tasks - how many tasks (nodes) that you require (same as -n)`
`#SBATCH --cpus-per-task=4		# number of CPUs (or cores) per task (same as -c)`
`#SBATCH --mem=2G			# memory required per node - amount of memory (in bytes)`
`#SBATCH --job-name prefilteringQC	# you can give your job a name for easier identification (same as -J)`
 
`module load powertools			# load necesary modules`

`cd ${SLURM_SUBMIT_DIR}			# specifying working dir`

`# This below is the real part of the code!!`

`mkdir test`
`cd raw_reads/`
`for fastq in *.fastq.gz`
`do gunzip -c "$fastq" | paste - - - - | wc -l && echo $fastq `
`done > ../test/reads_raw.counts`

------------------ end code --------------------

# So, what is this??? What are all those instructions? 

# test.sb represent a job, that is a file containing the code that
# will perform the  analysis we want to perform and all the instructions
# for the HPCC cluster about, how much time we need, how much computational
# power, how much RAM etc. 

# We will talk about it in class on Tuesday! So do 
# some research an be ready to answer my questions.

# Due to to the recent (unfortunately stil ongoing) migration of the
# HPCC nodes to a new Operative system this below is a very useful link

https://wiki.hpcc.msu.edu/display/ITH/2018+Environment+Update+and+Migration

# The last part of test.sb is the code itself, the bioinformatics script. 
# Let's run it and see what we get.

`[benucci@dev-intel18 homework]$ sbatch test.sb`
`Submitted batch job 420139`

`[benucci@dev-intel18 homework]$ squeue -l -u benucci`
`Wed Oct 17 21:28:17 2018`
`             JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON)`
 `           420139 general-l prefilte  benucci  PENDING       0:00     10:00      1 (None)`
`[benucci@dev-intel18 homework]$`

# When is done, navigate inside your folder and see what the code did,
# we will talk about it on the next Tuesday 

# If you need to contact me you can reach me by email, please see on
# the top of this README.txt 

############# HAPPY CODING TO EVRYONE!!! ##################
