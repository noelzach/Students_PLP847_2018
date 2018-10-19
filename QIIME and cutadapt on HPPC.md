# how to use QIIME1 or 2 in the HPCC, Michiagn State University
http://qiime.org/install/install.html

have a look at the created environemnts, run

`[benucci@dev-intel16 ~]$ conda info --envs`<br/>
`# conda environments:`<br/>
`#`<br/>
`base                  *  /mnt/home/benucci/anaconda2`<br/>
`py2                      /mnt/home/benucci/anaconda2/envs/py2`<br/>

Now create a new environment with QIIME 1, run

`[benucci@dev-intel16 ~]$ conda create -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda`<br/>

Now test it, run

`[benucci@dev-intel16 ~]$ source activate qiime1`<br/>
`[benucci@dev-intel16 ~]$ print_qiime_config.py -t`<br/>

Anytime you want to use QIIME 1 after installation with anaconda, 
you’ll need to reactivate your qiime1 environment by running

`[benucci@dev-intel16 ~]$ source activate qiime1`<br/>

and to exit

`[benucci@dev-intel16 ~]$  source deactivate`<br/>

# how to use cutadapt or 2 in the HPCC, Michiagn State University
https://cutadapt.readthedocs.io/en/stable/guide.html

`[benucci@dev-intel16 ~]$ conda create -n cutadapt -c bioconda cutadapt`<br/>

Then same as before for qiime, you can test the installation
by running the tool after activating it using conda.

# HAPPY CODING!!!



