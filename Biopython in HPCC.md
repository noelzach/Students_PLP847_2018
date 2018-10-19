# How to run Python 2 and Biopython in the HPCC cluster, Michigan State University

Useful links

https://wiki.hpcc.msu.edu/display/~longnany@msu.edu/Using+conda
http://docs.anaconda.com/anaconda/install/linux/

Download Anaconda here https://www.anaconda.com/download/#linux

Upload the installer in the HPCC and run

`bash ~/Downloads/Anaconda2-5.3.0-Linux-x86_64.sh`

Review the license agreement, clic Yes to agree.
Enter Yes to repend the Anaconda2 install location to PATH in your /home/<user>/.bashrc
The installer finishes and displays Thank you for installing Anaconda2
To make the installation effective run

`source ~/.bashrc`

After your install is complete, verify it by opening Anaconda Navigator

`anaconda-navigator`

Check the insalled version by running

`conda --version`

To use Biopython we need to create an environment with python 2 and then 
install biopython 

`conda create --name py2 python 2.7`

You will probably get prompted to install new packages, type ‘y’ and hit "Enter". 
When it is done, display your list of environments with

`conda list`

Now you can add a packahe to the created environment

`conda install -n py2 biopython`

To use conda and activate one of your environments and use it on the terminal
or inside a job type

`conda activate py2`
`<your commands>`
`conda deactivate`

Enjoy your Biopython on HPCC!





















