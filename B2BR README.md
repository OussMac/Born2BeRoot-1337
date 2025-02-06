# Born 2 be root (with bonus):


![](attachment/1b031ce6e6213cc77cee26dcafd41bde.png)


![](attachment/1e4bd7d4045aa61deed8654f9c6865d2.png)

---


 **Click To View [My Born2BeRoot Website ](https://mini1337.netlify.app/):**

![](attachment/fe49066c29456445e574e5b5133e74e4.png)

A mini recreation of our campus's website, which was hosted from within the virtual machine server i created and administered in this project.


---

What this entire project is about lies in understanding the Linux/UNIX-based like\
operating systems, and it's and introduction to the world of virtualization and system\
management.

The phrase itself (born2beroot), implies the end goal of mastering being the root user,\
the **Master Admin** of the system.

The key goals of the project are:
- Installation and Configuration of a system in a virtual environment .
- System and user management like setting up users, permissions...
- System security, like implementing secure systems, such as firewalls, SSH configuration and password policies.
- automation: using bash scripting to automate administrative tasks.
- ... and so on.

lets dive right into the details...\
|\
|\
|\
|\
|\
|\
**To skip The VM configuration, and into the first log in click here ---> [[#First login]]**\
|\
|\
|\
|\
|\
|
## Setting up and configuring the Virtual Machine:


### Downloading Debian : 

first we download the Debian `.iso` image (i'm gonna be using Debian for this tutorial),\
an `iso` image is basically a file that contains the exact copy of the entire data\
structure of a CD/DVD... and so on  like the ones we use to install operating systems\
normally

now instead of using a physical disk we have the `.iso` format for that\
it just makes things easier

Direct link to the official Debian `.iso` image : [debian.iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.8.0-amd64-netinst.iso)

or just head to : https://www.debian.org/download \
and download the `debian-12.8.0-amd64-netinst.iso`

### Virtual Box Configuration : 

great now that we have the `.iso` downloaded we launch virtual box (it's what i'm \
gonna be using in my case) you can use UTM if you don't have it as per subject \
instructions, the installation process should be similar 

1 - click on new to create a new virtual machine :

![](attachment/572bc36b0865db16b219e64bcede7389.jpg)

2 - we fill the details for the new virtual machine : 

![](attachment/8d6da7d08457a115594bfa68b412d789.jpg)

mainly:\
--> 1 ) here you choose a name for your machine folder where all its files will be stored\
--> 2 ) and then the location it will be stored in preferably your goinfre, because you \
will need a lot of storage space especially for the bonus.\
--> 3 )  and here the location to the downloaded `.iso` file from [[#Downloading Debian]] \
--> 4 ) skip unattended installation `(as in new virtual box version) you can setup users from within the configuration here), but we can do that during OS installation. `\
--> 5 ) click Next.

3 - for this example just give these values for the resources (these don't have to be exact since the subject doesn't specify, and you can change them later anyway) :

![](attachment/98620bc6f04fb4bcc7f732740e88990e.png)

4 - but here it's **IMPORTANT** to set 30.80 exactly as we will need it for our disk to have these exact values for the necessary partition required by the bonus :

![](attachment/1bd01e1be7a95e4ec0d3a151919cc382.png)

5 - the configuration should looks like this (press Finish): 
![](attachment/adc6263d1af063ba9f805bb5d8848be0.png)

6 - select your newly created  VM, and click start : 

![](attachment/80da9fd289277fbd5fe9289546fabc81.jpg)

## Debian Installation : 

#### Click Install (The Subject Specifies No Graphical Installation) :

![](attachment/5b19c04f982b92edf8e8a7383ef14a78.png)

#### Choose The Language For The Installation (In My Case English) :

![](attachment/ac3f2f66bd38eb05683bbfdb94f67420.png)

#### For The Location I'll Go With The US In This Example

![](attachment/8d54892f6a7e7a50c484eb70b5c39a39.png)

#### And then American English For Keyboard Config : 

![](attachment/d57fe67c16c183c3f4fe75ad37ff2c4a.png)

#### We Create A Hostname For The Machine : 

the subject specifically states to use our intra login with 42 at the end\
example : `<username>`42

press **Enter** to continue.

![](attachment/2e15e0b48fff193a9f871b1d35e289f7.png)

#### Leave This Empty As The Subject Doesn't Mention it :

press **Enter** to continue.

![](attachment/b4be900191b9e25403d03442e2190287.png)

#### Choose A Password For The Root User of Your Machine :

it can be any password for now, but once we implement the password policy, we will \
have to change it to suit the new rules.

press Continue and **re Enter it.**

![](attachment/47be50e61df7574a3aa1e9dd1951499b.png)

#### Now onto setting up the first user :

enter the full name of this user

![](attachment/98e8fa6086aa804313ef856540622365.png)

#### Then The USERNAME of Our New User :

preferably your intra login as the subject mentions so.

![](attachment/29f74fc0ccc67cdf8d172a44bb265ed9.png)

#### Then Set A Password For This User : 

It can be the same password for the root user, as like i said if it the doesn't follow the\
password policy required by the subject we will have to change it later anyway\
it is better to think about the password policy from the start and set the password\
accordingly.

re Enter the password for the user and let's move on.

![](attachment/5d9d7365f6f1492a9be08a9225033bf0.png)

#### Choose A Timezone :

because I've set my location in the US I will just set my timezone to Eastern for this example.
![](attachment/851140de0a0a87d80329c8b339ed4c49.png)

### Disk Partitioning :

In order to do the bonus part and have our partitions set like this : 

![](attachment/00bb9b126e68577c0c208f859501ed44.png)

we will do the partitioning Manually.

#### Manual Partitioning :


![](attachment/80402b6d03ed4e6213e3dc53a6df98a8.png)

Now don't panic, you'l see a lot of confusing information and details.\
But the only thing we care about here is **(sda)**

#### SCSI (Small Computer System Interface Controller) :

![](attachment/9ccda87a5cd84afcae7944931daa4be7.png)

SCSI : is basically just a Tool/Controller we will use to partition the disk.

And the 0s  in --> (0, 0, 0) represent device identifiers, they work like indexes, unique \
numbers that are given to each device to identify it.

Firts 0 : The SCSI Controller ID, The SCSI used to work on/partition this device.\
Second 0 : The BUS ID, id of the SCSI bus used.\
Third 0 : The device ID, the specific device connected to this bus, in this case (sda).

this basically means we are going to partition the first disk on the first bus using the first controller.

and like i said we only care about **sda**, if u see in the subject, the entire partition tree hierarchy is rooted from **(sda)**

#### sda :

sda means SCSI disk, and it's basically the first disk, the naming convention goes like :\
sda : first disk.\
sdb : second disk.\
sdc : third disk.

and partition numbers (e.g., sda1, sda2...)\
sda1 : first partition of disk a\
sda2 : second partition of disk a

and so on...

now press enter and confirm **yes**, to create the first partition on sda.

![](attachment/8e4398c80cf9ef2f6132fa85e5fafea2.png)
#### boot Partition :

Now Select the FREE SPACE, to create the first boot partition.

![](attachment/bbb6b7929e1e30a4c71cefe299887624.png)

Confirm to create a new partition.

![](attachment/b53214a599f2562c78a7340b86f18c3d.png)

Give it 525 MB (click on [[#MB to Mib]] to understand why 525 MB and not 500 MB like in the subject).

![](attachment/a0f7ecf031b90d5b5c80cf0ced4cd789.png)

Make it primary.
Click on to understand what this means

![](attachment/1077dfb73be146d06781e596b7a0f617.png)

And at the begining of the disk.
(i'll explain later what it means puting this at the end or the begining) here.

![](attachment/3a72e9483c9fcf33a561c0ca2d1311da.png)

Make sure these are set correctly:

---> Use as : Ext4 journaling file system
---> Mount point : /boot
---> Bootable flag: on

Notes : 
The journaling file system is a system to retrieve and read data from a hard disk \
it works an a way that keeps track of changes before they are committed onto the \
disk the reason for this is in the event of a system crash or power shutdown, we lower\
the likelihood of the data to be corrupted and is backed up in this "journal" logfile.

and Mount point : simply means the directory, that is linked to a file system, in our\
case the boot disk partition.

Bootable flag: set it to true as without it the Grub boot loader we will install later on in\
that 500 MB won't be able to boot.\
we set these and press done.

![](attachment/20e4a55b4808b6e85f809080ac672f59.png)

it should look something like this :
![](attachment/117ea53d92a301ff346874f27c0d5ca4.png)

##### MB to Mib: 

Now as for why 525 MB instead of 500 MB\
This all comes back to how computers calculate disk storage, storage is calculated in \
binary (base 2), that's why 1 MiB is actually 1 048 576 bytes.
and 1 MB is 1 000 000 bytes
and when setting partition volumes it shows during installation as 500 MB\
but when it is calculated using `lsblk` command, because again computers do all their\
calculations in binary it will show as `476 MB`.

but to show it as 500 MB like the subject

![](attachment/1c3070e7296ea7a18c62d7c42e9da977.png)

we need to set a number that will give us exactly 500 MB when calculated in binary
and this number is ~= 525 MB.\
using a `MiB to MB ` converter :

![](attachment/c236015e3386c96724d7446de200e3fd.png)

#### Giving The Remaining Space To sda5 : 

Select the remaining FREE SPACE and press Enter.

![](attachment/89b29abe95a4f2b5f949a7719f0b540c.png)

press Create a new partition and give it max (the entire remaining space).

![](attachment/c3be2a3e5fb498171381491478f4a65f.png)

Choose a Logical type.

![](attachment/2597a7218b8f61a34f72928e33f17eef.png)

Set these :\
---> Use as : Ext4 journaling file system
---> Mount point : Do not mount it

![](attachment/e59e90f4584ddfdc683140163d17da41.png)

Should look something like this.

![](attachment/aaa76652f29498945be3023c019c9143.png)

#### You Can Skip this Explanation :

click here to skip it ---> [[#Logical Volumes]]


The reason for this not being `sda2 or sda3` is that the type of this partition will be logical, and logical volumes take a different section of the hard drive.
let's talk about them for a second
##### Master Boot Record :
But first let's address the elephant in the room, The Master Boot Record the MBR is like a table data/contents, and is the first sector of the hard disk, it can only have up to 4 primary partitions, `(that's why Logical volumes jump straight to sda5, that is located in the extended boot record, we will talk about in a second)` , It also contains the first tiny program called the bootstrap code or boot loader this is what starts our operating system in the first place without it nothing will boot
but overall the structure of MBR looks like this.

![](attachment/3440b1785bf10412618e0da2b1094df0.png)

this is all to explain the jump from sda1 for boot partition and sda5 for the logical partition.

##### Extended Boot Record (Logical Partitions) :
The extended looks a little something like this, feel free to research more about this.

![](attachment/478dc5e09e3e7bf81ce3cd8cd8f55aae.png)

...
Lets Finish The Tutorial.
#### Logical Volumes:
Think of logical volumes like logical disk partitions that are dynamic, which you can \
size and resize later using the logical volume manager LVM :\
and its commands like ...

`lvextend`\
`lvresize`\
`lvreduce`

This is why we don't have to convert all this from GiB to GB as we will change them \
later on.

![](attachment/ed743f1ee659fb53e74137e1e899370c.png)
##### Creating An Encrypted Logical Volume : 
As u can see under the sda5 there is sda5_crypt\
So first we need to put a layer of encryption under above the logical volume and then \
create partitions on it.

#### Click on Configure encrypted volumes :

![](attachment/60838293d381a44b81d4860e3a17b25b.png)

And click yes to confirm, once this is done (and it takes quite a long time), we cannot go back, so make sure the configurations are correct.

![](attachment/8ff51461030874becdd63e3a1c02826f.png)

Click create encrypted volumes

![](attachment/d170bdee2f238d44108cf84870826420.png)

And choose sda5 using space then press enter to continue.

![](attachment/2da1c531cb39caf96c1538b1503b90aa.png)

click Done.

![](attachment/9fa284b881c4abec248d002de6d46e88.png)

Then click Finish.
![](attachment/c1effa4af39925e4f7cf8b4caf407db5.png)

Confirm Yes.

![](attachment/d19e83c578de41fcf43e70cfd4e73462.png)

Now wait until encryption is done...\
Then type in a encryption password that you will remember to access the VM later on

![](attachment/ebddd2f462a149188a4658ea9fe6c496.png)

### Logical Volume Manager :

Now we are going to create logical partitions using the logical volume manager

#### Click Configure Logical Volume Manager

![](attachment/16f4ae0b0234c132d38f26d7670f30a5.png)

And confirm yes.

![](attachment/9b2f5c09f648b208ddcf9c26120cfd8d.png)

It should look something like this: 
Click create volume group.

![](attachment/0117eecaaf2342a92b8e8794e47bb9ec.png)

And name it LVMGroup.

![](attachment/aef71857d4eb06681af4785c25a376c4.png)

Choose the encrypted partition using space.

![](attachment/4868605c1f6188b799aaab9e0be7f95f.png)

#### Creating the logical volumes :
Now it should look something like this.
Click Create Logical volume

![](attachment/aeae9eedff9e399db4c8e5b350d746ab.png)

choose LVMGroup

![](attachment/676349842058b79ea420c6b6890419d4.png)

Create the first one and call it root.

![](attachment/2bee053242720c23c7efe1af7b06a6f1.png)

Give it 10 GB (remember we will change these later using LVM commands).

![](attachment/0143edaa9acee6d2967132c99db8f09f.png)

Now click Create logical volume again and do it for all of them
root (already done) --> 10 G
swap  -->  2.3 G
home  -->  5 G
var  -->  3 G
srv  -->  3 G
tmp  -->  3 G
var-log  -->  4 G

![](attachment/06bdc502d082d25f4f605a7675b31036.png)

#### LVM Partitions done :

Should look something like this now click finish

![](attachment/3bfa1a9e6fad2cb760db69fee8923b56.png)

(will explain later in detail how to do these but it should look like this make sure they are if i didn't update this)

This video addresses this in detail -->  [Born2beroot Partitioning (Bonus)](https://www.youtube.com/watch?v=OQEdjt38ZJA)

![](attachment/ecabb6dd293be370481eca99bfda76db.png)

And then confirm yes.

![](attachment/4b84cf98a24bfca754b08e27ece2e385.png)

wait for it to install.

Select No as this is the only `.iso` we want to install

![](attachment/bf173e5153deb1595eda70753679c4b0.png)

For this example again i will just select the US.

![](attachment/a4b1d8029462215b4eda164503ffab1c.png)

Select `deb.debian.org`

![](attachment/0a69ca83495480c31d9698f795ded7e0.png)

Leave this blank and continue.

![](attachment/7317358ac0d9fb23329cf84cae3d4ed2.png)

just press No for this.

![](attachment/154c9955003313ec760ff858e4d59033.png)

Deselect all these using space (very important to have them deselected).
And then press enter.

![](attachment/8f46761aa8a1ececf7923912699a06d3.png)

Press Yes to install the Grub boot loader.

![](attachment/198fd769fa0477818f47034532ba55a1.png)

Choose our sda disk.

![](attachment/10ea9b24efa2038f74b69388dcb0896b.png)

And wait for it to install.
Then finish the installation and reboot.

![](attachment/2bafb041177e03365a101ff55c028cfc.png)

Once it is done.

### Setting up The Operating System :
#### First login :

---> type in your encryption password.
---> type the username to log in (your intra login)
---> type the password you set here --> [[#Then Set A Password For This User]]   

You should have something like this.

![](attachment/7cb02fcf418a68c0832fb48c35c6c64e.png)

##### lsblk :

By typing `lsblk` we can list block devices and information about them.

![](attachment/037745399e5748e13c7dbe511f7eb0f5.png)
And you can see that the logical volume partitions do not match the values we set for them from before..

let's fix that right now using some Logical Volume Manager commands.
you can check the manual page for `man lvm` for more details or [here](https://linux.die.net/man/8/lvm)

and also `man lvresize`, because mostly we will utilize this command.

##### Lvresize :

To simplify the usage of this command
```
[ simplified man Defenition ]
NAME
       lvresize - Resize a logical volume by a specified Size
USAGE
	   lvresize [Options] [Size] [Device Path]
```

--> Options to keep in mind for this command are simply :

`-l`  : If you wanna resize is extents, which basically means in percentages `%`
`-L`  : For resizing in absolute units, basically in MB, GB, TB...

and 
--> Device Path :

where the logical volume is located, usually somewhere like :
`/dev/LVMGroup/<logical volume>` 

--> Size :

well and size is the size we want to resize by

#### Login As Root :

First you will have to do this as root.\
So make sure to type in :

```
su -
```

- su : stands for substitute user, if no users is specified it `defaults to root`
- - : and the dash basically loads the target user's environment, and home directory...

```
[ And enter the root password. ]
```

#### Resizing Logical Volumes :

first you will have to do this as root, so make sure you did the previous step, or already logged in as root.

Resizing root logical volume :
```
lvresize -L 10G /dev/LVMGroup/root
```

![](attachment/6a40acaf79972645a0ea0344b6d4e2a5.png)

you should see something like this if it was successful.\
now let's do the others.

(skip swap for now i'll explain in a second) ---------------------------------------------

home   :
```
lvresize -L 5G /dev/LVMGroup/home
```
var       :
```
lvresize -L 3G /dev/LVMGroup/var
```
srv       :
```
lvresize -L 3G /dev/LVMGroup/srv
```
tmp      :
```
lvresize -L 3G /dev/LVMGroup/tmp
```
var/log :
```
lvresize -L 4G /dev/LVMGroup/var-log
```



Now as for swap :
we will use the extents option `-l` and take `100%` of the remaining free space.
```
lvresize -l +100%FREE /dev/LVMGroup/swap
```

now i do it this way because when when resizing something with a `,` always causes problems.\
if everything is done correctly the output `lsblk` should be exactly like this.

![](attachment/4b2f55e67af7cd9f388506074e266528.png)

Now with all that done we can start configuring our newly installed operating system.

#### Installing sudo : 

we need root for this so make sure to do this first --> [[#Login As Root]] 

Once we logged in as root.
##### install sudo :
Type in :
```
apt -y install sudo
```

 and wait for it to install, but first let's explain what we just did

Usage of apt :
```
apt [options] [action] <package>
```

`apt` - an advanced package tool 

`<package>`  - the package to install
`-y` - this option states, to assume yes to all prompts when asked `yes or no` when installing a package

`install` - the option to install, there are several more like, `remove, reinstall, purge...`


one of the things we are going to use a lot is apt, so we need to first understand what apt is...
##### What is APT, And What is the Difference Between APT and Aptitude :

APT, stands for Advanced Package Tool, and it is a command line interface tool for Debian based distributions, to handle and manage packages it is built on top of the built in dpkg library, that comes pre-installed in Debian based distributions.

and Aptitude is basically the front end built on APT, and it is also a command line tool, but comes with a GUI, it is more user friendly and offers more options when installing a package, such as conflict resolution where it asks for user input when there is a conflict between 2 packages or more

apt --> better used in scripts and automation
aptitude --> better used by users and acts as a front end for apt

![](attachment/620212d18df7cdc16dbb4899449a694c.png)

##### sudo reboot :

once sudo is installed, make sure you did [[#install sudo]] .\
Type in :
```
sudo reboot
```

To reboot the machine.

press enter to choose our operating system **Debian**\
and re enter the encryption message and log back in as a user.

once logged back in, switch to root again.
```
su -
```
and type in the password.

To make sure it's installed just type in `which sudo`, it should give u something along the lines of `usr/bin/sudo`, just the path to its binary file that executes when you call the `sudo` command

Note : because in Linux essentially everything is a file...

##### Quick Note : How to add a user

we can use the `adduser` command to add a new user to the system `[check man adduser]` for more details..

Type in :
```
adduser <login>
```

For example `add user <intra-login>`
it should already exist because we set it up during OS configuration.

![](attachment/a02ab9d00cca3aa3f161ada1eda66226.png)

There is also the `useradd` command so what is really the difference between them.
##### The difference between useradd and adduser :

**adduser** : Is more of a high level command to create and add a new user to the system which offers, more features and a more user friendly interface.
for example (interactive) : 

- It asks for a password 
- Asks for optional information
- automatically creates the directory for the user

basically handles a lot for you, that you don't have to specify.

---> The Manual prompts administrators to use adduser, and the higher level utilities instead of their low level counterparts 

**useradd** : is more of a low level command, with the same utility and function as adduser, and requires more explicit options to work, `[not user friendly]`

unlike adduser --> **Does Not Prompt for input** (not interactive)

##### Adding and Creating A New Group (addgroup):

the `addgroup` command adds a group to the system, and it's low level counterpart is `groupadd`

this said we can use the command to add group `user42` as specified by the subject.

```
sudo addgroup user42
```

\* use sudo if not already in the root user!

![](attachment/a658bb0bc6e1df1a89792e91a33a2e35.png)

should get something like this.

**GID** is the group identifier, think of it like a reference to the group, which is used by the system to assign to files and users, to keep track of which users have access to which files.

##### Adding User To A Group : 

to add our user `<intra-login>` to the user group as specified by the subject.\
in my case

```
adduser oimzilen user42
```

and also 

```
sudo oimzilen sudo
```

to add the user to the `sudo` group.

**sudo group**  : which basically grants users on this group sudo privileges.

what sudo means : basically lets the user run the command as the root user\
or (super user), that has unrestricted access to the entire system.

you can check if the user is in these groups using the command.

```
getent group user42 sudo
```

![](attachment/752892a0fe585df1d7714afd1e882e9e.png)

**Note (feel free to skip) :**

you can vim into `/etc/sudoers` file and find the rule `%sudo ALL=(ALL:ALL) ALL`\
which basically means that any members of the sudo group can 
`run all commands as any user`
`and as all groups`
`and all commands`
``
#### What is SSH :

SSH is or secure shell is a terminal emulator to control and communicate remote servers/machines, and it ensures sending and receiving data in an encrypted secure line. 

The benefits of using OpenBSD Secure Shell, simply comes down to security,
before it there was Telnet which people used to remotely control machines in a command line terminal interface, but it was not secure which means anyone can intercept and read the messages sent and received clearly.

#### Install SSH :

First update the list of packages to ensure the system has the latest updates.
```
sudo apt update
```

Then install the openssh-server :
```
sudo apt install -y openssh-server
```

`-y` : make a good habit of using the option -y, it simply assumes yes for any prompt
apt sends your when asking for user input.

wait for it to install, and once it's done.

to check if it's up and running we use the command

```
sudo service ssh status
```

the `service` is basically a command that runs a system V script, system V script or (SysV) was the traditional way of managing services in Unix-like systems before newer systems like systemd.

and it basically runs the init script in the `/etc/init.d/` directory\
along with the command for this script to use `(start,restart,status...)`
this also works
```
/etx/init.d/ssh status
```

we can also use the systemctl command.

```
sudo systemctl status ssh
```

which does basically the same thing, but it is more modern.

#### Configuring SSH :

now open the file `/etc/ssh/sshd_config` using nano or vim
```
sudo nano /etc/ssh/sshd_config
```

uncomment and changes the lines : 

\#Port 22 ---> Port 4242

This specifies the port the ssh server listens to for incoming connections

\#PermitRootLogin  prohibit-password ---> PermitRootLogin no

`Note: prohibit-password, means u can still log in as root but in a way other than password authentication, for example using an ssh key`

And this basically adds an extra layer of defense as to it prevents direct root login through ssh, an attacker would need to first compromise a normal user then escalate privileges using `su`, and or brute forcing the root password.

Like this : 

![](attachment/943004d299232bf47bae7ce6f1e1a968.png)

and then we also configure `/etc/ssh/ssh_config`
```
sudo nano /etc/ssh/ssh_config
```

Changing :

\#Port 22 ---> Port 4242

This is client configuration, when the machine itself acts as a client,
this the port it uses by default to connect to ssh servers.

Should look something like this : 

![](attachment/407ef22a31f68cf015479c3704c07625.png)

---
##### Difference between ssh and sshd config files : 

ssh_config : is for client based configuration,and is basically the port which the client connects to (by default), for when the machine itself connects to a server, it's better to specify a port there which it will use by default when running the command
```
ssh <user>@<ip>
```

and without having to do this : 
```
ssh <user>@<ip> -p <port>
```

Note : `the machine can connect to itself using this method that's why it's better to have the ports match, and this is called a loopback ssh connection`

sshd_config: is for server configuration, and is basically the port which the server listens to for incoming connections.

---

Now restart the service :

```
sudo service ssh restart
```

And check the status using the command : 

```
sudo service ssh status
```

Should look something like this : 

![](attachment/12b758f53ae86b0785e711e804978f98.png)

#### To Connect via SSH :

Make sure to port forward the port in the Virtual Machine configuration :

Click on your virtual machine.

Then Click on settings.
![](attachment/687cb620a48f963d99d5814272ec8da7.png)

Go To Network --> Advanced
![](attachment/88d13966306f2be2d32d9ab868d82f27.png)

![](attachment/bb9b34421953b1b47247aa2f152255c1.png)

And then Port Forwarding
![](attachment/314f75e996587b4ab8d420242e3e8ffa.png)

This Opens this tab : 

![](attachment/eb45bc4ab1556f266b25314cd3c2e873.png)

click on the green `+` to add a new rule :  and set it as TCP and make sure the Guest Port is exactly 4242, the Host can be whatever it's what we will use to connect to the server but it always redirects to the 4242 Port from the VM's perspective.

**IMPORTANT** make sure the connection protocol in Network is **NAT**.

#### What is NAT (Network Address Translation) : 

Private IPs: Basically think of a Local network like people inside a house each have phone numbers (Private IPs), that they use to communicate with each other and is used by the house to identify them,

Public IP: And the house has one public IP address, that is used to contact the outside Network (The Internet).

NAT: Is like a doorman (the router) that translates the private IP addresses into the public IP address in order to access the outside network and when sending out messages.

When a reply comes back the doorman (NAT), knows how to translate the public IP address back to the private one it is sent to.

---
#### Port Forwarding :  

**Port forwarding** is a technique used with NAT to allow external devices to access a specific service or application on a device inside a private network.

- **Analogy**: Imagine your house (private network) has one door (public IP), and each room (device) inside the house has a specific function (a service running, like a web server or game server).
- **Port forwarding** is like telling the doorman (the router) to send any visitors knocking on a specific door (a port) to a particular room (a specific device) inside the house.

For example:

- Your computer inside the house is running a web server on port 8080.
- To allow someone from outside the house (the internet) to access the web server, you tell the router: "If someone asks for port 8080, send them to the computer in room 3."
---

### UFW (Uncomplicated Fire Wall) :

Basically UFW is a tool to manage netfilter, the Linux firewall, using a command line interface, and it being uncomplicated comes from the fact that it simplifies the process, and is more easy to use and user friendly, 

What is a Firewall : 
Think of a firewall like a gate keeper (b7al chi 3sas) , which means a it is a security system for our network that controls outgoing and incoming network traffic, and deals with them according to predetermined security rules.

Without UFW we will have to manage netfilter directly using iptables commands which are more... well complicated.


**This is just An Example (You don't have to do these commands)**
Without UFW : 

```
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Using UFW : 

```
sudo ufw allow 22/tcp
```

basically simplifies the process.

Now let us install it.

---
#### Installing UFW : 

We can install UFW using the command: 

```
sudo apt install -y ufw
```

once Installed.

We enable it to make sure it starts on system startup.
```
sudo ufw enable
```

Then to allow the port 4242 we type in
```
sudo ufw allow 4242
```

 And to check the status
 ```
 sudo ufw status numbered
```

Should look something 

![](attachment/3283a347eaac1f41412df2165dd04af8.png)

`numbered` option basically just numbers the rules, it is good to know when trying to delete a rule.

To delete a rule we can use :
```
sudo ufw delete <rule-number>
```

---
### Sudo Policies : 


Now to configure the password policy we use the command :

```
sudo visudo 
```

which basically opens the file `/etc/sudoers`, usually in `nano`.

we have to add the following rules 

---

```
Defaults	passwd_tries=3
```

`passwd_tries` - means the maximum number of tries for an incorrect password, when using the sudo command.

For example
when it is `passwd_tries=3`
and we try to use sudo as normal used, we will have only 3 tries for the password :

![](attachment/1c123d648bad0c1e169c522f69406af4.png)

---

```
Defaults	badpass_message="Custom Error Message"
```

It is by default the Sorry, try again. message
but we can customize it however we like using this setting, when a user tries to use sudo, this is the error message for a wrong password.

Example : `Defaults	badpass_message="lol u suck"`.

![](attachment/51bfb07e51cb1e94a9c77ec930b044f0.png)

---

```
Defaults	logfile="/var/log/sudo/sudo.log"
```

let's first create the sudo directory in /var/log

```
sudo mkdir /var/log/sudo
```

and give it only the read and write commands and only for the owner,`the root in this case`: 

```
sudo chmod 600 /var/log/sudo
```

same thing for the file :

```
sudo touch /var/log/sudo/sudo.log
```

And :

```
sudo chmod 600 /var/log/sudo/sudo.log
```

This file is to log general information when using the sudo command
e.g.: the command used, who used the command...

---

Now let's setup the input and output logging.

```
Defaults	log_input, log_output 
Defaults	iolog_dir="/var/log/sudo"
```

the `log_input` and `log_output`, is necessary to log the input and output when using sudo, and this is for more detailed logging.

Once this is set up information about sudo usage will be logged anytime it is used

to view the input you simply cat it's contents
```
cat /var/log/sudo/sudo.log
```

To view the output you can use the `sudoreplay`

---

```
Defaults	requiretty
```

this basically means you need a terminal environment to run the sudo command,

for example trying to run a command through ssh without having a terminal established.

```
ssh <user>@<ip> -p <port> "sudo <command>"
```

Error message:

![](attachment/2f4632757e026cd32407f98ebc68284e.png)

---

And finally the secure path:

```
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

which basically specifies the paths the system searches for commands in when using sudo, and this adds a layer of security.

for example when using sudo this overwrites the users path for the commands to these paths, so if an attacker for example places a malicious script in the common path for system binaries/commands like `ls`, `cat` for example it used the ones in these secure path.

---

The sudoers file in `/etc/sudoers` should now look like this

![](attachment/ab0fe6d74a1e01ff9ba99a5653716834.png)

---

### Password Policy :

`/etc/login.defs` provides system wide configuration for user password management and password policies.

here we will set up :
- Maximum days for password expiration : 30 days.
- Minimum days before allowing users to change password : 2
- Days until users receive warning message before their password expires : 7

we head to the `login.defs` configuration file.

```
sudo nano /etc/login.defs
```

and change the following
```
PASS_MAX_DAYS 30
PASS_MIN_DAYS 2
PASS_WARN_AGE 7
```

Like so

![](attachment/256aa0ba6119ade1c810d180a204141e.png)

make sure to change these parameters for the root and user `<intra-login>` .

because users that have already existed before changing this config file do not get effected 

a quick way to check if they changed is by 

```shell
chage -l root
```

`chage` : check age 
`-l` : list mode

![](attachment/22709910aac41b1893f1b8887f21e799.png)

should look something like this, you can change it using the corresponding flags
```
chage root -M 30 -m 2 -W 7
```

![](attachment/8c92467f22ea6d267febba471b236852.png)

#### Install libpam-pwquality :

Now we can enforce more password policies using the `pam` package

install it using

```shell
sudo apt install -y libpam-pwquality
```

once it is Installed, we must edit the file in `/etc/pam.d/common-password`.

```shell
sudo nano /etc/pam.d/common-password
```

and next to `retry=3` : maximum number of retries allowed.\
add these :

- `minlen=10` : minimum length allowed for new password, can't be less than 10
- `ucredit=-1` : must contain at least one uppercase character.
- `lcredit=-1` : must contain at least one lowercase character.
- `dcredit=-1` : must contain at least one digit.
- `maxrepeat=3` : maximum number of characters that is allowed to be repeated consecutively.
- `reject_username` : does not allow using username in password.
- `difok=7` : at least 7 characters should be different in the new password than in the old one.
- `enforce_for_root` : enforces this policy for root.

![](attachment/7c82a7f843371d842c1934a4d67c5a8b.png)

Should look something like this.

### monitoring.sh Script : 

Now we have to write a script to achieve Displaying This Broadcast message to all\ users with a structure like this (In The subject):

![](attachment/bab4f4f5fb2c45a1d97c8b5c95e68295.png)

we Create a script called `monitoring.sh`\
it can be anywhere just remember it's  path, for example `/home/oimzilen/scripts`

We will build the script step by step and as we go explain each command used.

First we type in this sequence:

---

```bash
#!/bin/bash
```

`#!` : This sequence of characters is called the shebang sequence, it basically means \
to interpret this script using the bash shell.\
`/bin/bash` : is the path to the shell binary we want the script to be interpreted in. 

The importance of this is to avoid for example: if this script is run in an sh shell \
environment, without it will run into syntax errors as it has different a syntax.

---

```bash
wall "<message>"
```

wall : This command writes a message to all users (write to all).

we will use it to broadcast this message across the system. 

```bash
wall "
	#Architecture		: 
	#CPU physical		: 
	#vCPU			    : 
	#Memory Usage		: 
	#Disk Usage		    :
	#CPU load		    :
	#Last boot		    :
	#LVM use		    :
	#Connections TCP	: 
	#User log:		    : 
	#Network		    : 
	#Sudo			    : 
"
```

we will just display the constants for now and as we go we add variables, for variable \
information that we will fetch from the system using shell commands

Example : 

```bash
arch_variable=$(<command>)


wall "
	#Architecture	   : $arch_variable
	...
"
```

---

```bash
# Architecture Details
ARCH=$(uname -a)
```

`uname` : command prints system information (stands for Unix Name).
`-a` : specifies to print all.

Now we just put this variable like this :

```bash
ARCH=$(uname -a)


wall "
	#Architecture	   : $ARCH
	...
"
```

And we will keep doing so with each command as we go.

---

```bash
#Physical CPU Count
PCPU=$(grep "physical id" /proc/cpuinfo | uniq | wc -l)
```

\
`/proc directory is a file system mechanism in linux that contains information about processes hence the name, and is controlled by the kernel at runtime,`
\

`grep` : searches for all occurrences of an input.\
`"Physical id"` is the indicator of a physical CPU that we want to fetch\
`wc` : counts all the word occurrence, and `-l`, specifies counting each line.\
`uniq` : basically gets rid of repeated IDs and displays them as one.

because for example :

```bash
➜  ~ grep "physical id" /proc/cpuinfo
physical id	: 0
physical id	: 0
physical id	: 0
physical id	: 0
```

This shows 4 physical IDs but of the same physical CPU, not using `uniq`, will result in counting this 4 times while only having one physical CPU.\
The reason getting this, is that each "processor", `logical processor or in other words (core)`  or `virtual cpu`, displays the ID of the physical CPU its from.

[This](https://superuser.com/questions/388115/interpreting-output-of-cat-proc-cpuinfo) is a great explanation for it 

---

```bash
#Physical CPU Count
VCPU=$(grep "processor" /proc/cpuinfo | uniq | wc -l)
```

Same command as before just this time we grep `"processor"`

Like i said this represents a core entry, also known as a logical/virtual processor.

---

```bash
USED_MEM=$(free --mega | grep "Mem:" | awk '{printf $3}')
```

`free --mega` : displays information about memory usage in megabytes.\
we grep `"Mem:"` : because it displays information also about swap Usage.

Now What is swap, think of it like a virtual memory that the system uses when the RAM is full, and it is located on the disk (SSD or HDD).

when our physical RAM is insufficient, the computer uses space on the disk (called the swap) for memory tasks `(basically data li ghay7t fram kay7tha tma)`.

and finally in this command we use awk, awk is basically a powerful text processing tool, and it is a programming language that u can use to do a wide range of actions.

here we use `awk` to print the third column in :

```bash
Mem:            1007         498         475           3         178
```

which is `498 MB of used memory`

---

```bash
TOTAL_MEM=$(free --mega | grep "Mem:" | awk '{printf $2"MB"}')
```

same command as before but now we print MB next to total used memory.\
so the output looks something like this : 

```bash
#Memory Usage: 74/987MB (7.50%)
```

---

Now for the percentage, basically we will use the same concept but use specifiers in \
printf, and calculate the percentage using the formula.


```
(used/total)*100
```

like this :

```bash
PREC_MEM=$(free --mega | grep "Mem:" | awk '{printf("%.2f%%", ($3/$2)*100)}')
```

same command, we just use the format specefier `%f` for floating point numbers,\
and we specify two numbers after the `,` like so `7.50` \
and the `%%` is to print the percentage.

---

Now for Disk Usage, to calculate used disk space.

```bash
USED_DISK=$(df -BM | grep "^/dev/" | awk '{UD += $3} END {printf UD}')
```

`df` : This command displays information about the disk space usage \
and the option `-B<plus a specific block size>` displays these values in block sizes \
that we can specify it simply means megabytes, gigabytes...

`-BM` --> In Megabytes.\
`-BG` --> In Gigabytes.
...
`grep "^/dev/"` : we grep only the devices to not include `tmpfs` files which are \
basically the sizes used by memory or swap.\
Anything else is actual disk space.

`awk` , we process the input line by line , and execute and action that puts and adds \
the values in each line to a variable `UD` , like this `{UD += $3}` 

and then another action block, `{printf UD}` we basically just print the variable\
and we make sure to do this at the end of the processing using the pattern `END`.

---

Total Disk space is basically the same but we convert to Gb using the following formula


```
(MbTotal)/1024 = ..?.. Gb
```

 Now in Code
 ```bash
 TOTAL_DISK=$(df -BM | grep "^/dev/" | awk '{TD += $2 } END {printf("%d", (TD/1024))}')
```

Same command as before, but we translate MB to GB by dividing it by 1024.

---

Now for the Cpu Load, im going to use the command `iostat`, from the `sysstat` package, we can download it using the following command.

```bash
sudo apt install -y sysstat
```

once installed, type in.

```bash
iostat
```

`iostat` is basically a tool, used to checkup on your system's performance.

```bash
# It should give an output like this
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.53    0.00    0.31    3.46    0.00   95.70
           # ..........................................
```

we only care about the **idle** portion, which means the amount of time the CPU is sitting idle and not doing anything, in the form of a percentage.

we will just do simple math where :


```
100% = idle% + x%
```

and to find x which is the amount of CPU usage in the system, we subtract idle from the total which is logically 100\%

```
x% = 100% - idle% 
```

This will give us exactly how much of the CPU is loaded.

now lets do this in code.

```bash
CPU_LOAD=$(iostat | grep -A 1 "idle" | grep "^ " | awk '{printf ("%.1f%%", 100-$6)}')
```

`iostat` : lists statistics about CPU usage.\
`grep -A 1` : fetches the line that includes `"idle"`, but the flag `-A <NUM>` includes how many trailing lines we want with it.\
`grep "^ "` : then we grep the spaces that only occur at the start of the line, to get rid of the header.\
`awk` : we use awk to parse the provided output and calculate the usage using the formula above, then print it using printf.

---

```bash
LASTB=$(who -b | awk '{printf $3 $4}')
```

the flag `-b` from the command `who` shows the time of the last system boot, like this for example.

```bash
➜  ~ who -b 
         system boot  2025-01-09 15:43
```

and then we print using awk the third and fourth column.

---

```bash
TCP=$(netstat -t | grep "ESTABLISHED" | wc -l)
```

we use `netstat` to view network statistics and with the flag `-t` which views all TCP connections.
`grep "ESTABLISHED"` - then output only the established ones.

an established TCP connection basically means the communications that are \
successfully set up between two devices(client/servers), using the TCP protocol,\
which means the TCP three-way handshake is successful between the two.

##### TCP handshake :
basically happens in 3 steps:
- SYN : the client sends the server a synchronization request
- SYN-ACK : the server acknowledges the SYN request and sends one back.
- ACK : the client accepts the SYN request of the server completing the handshake

once this happens the connection is set as : ESTABLISHED.

---
```bash
USER_COUNT=($(who | awk '{printf $1}' | uniq | wc -l)
```

`who` : lists all users logged in.
`awk` : prints the first column that shows the username.
`uniq` : gets rid of repeated usernames.
`wc -l` : counts the lines (users).

---

```bash
IP=$(hostname -I)
```

we use the `hostname` command with the flag `-I` to get the host IP address.

```bash
MAC=$(ip link | grep "link/ether" | awk '{printf $2}')
```

we use the command `ip` with the option `link` to view network interfaces , and grep on "link/ether" to print the MAC address.

the MAC address is a unique hardware identifier that is on any device set by the manufacturer.

---

```bash
SUDO=$(journalctl -q _COMM=sudo | grep "COMMAND" | wc -l)
```

we use the `jorunalctl` command which logs metadata about the system including command usage, and we quite the warning message using the `-q` flag.\

we specify only sudo commands, by filtering only sudo executable script entries using `_COMM=sudo`.

we filter once more because it logs as well when root starts or exits a session,\
using `grep "COMMAND"`.

and then we count the lines.

---

```bash
#!/bin/bash

# Architecture details
ARCH=$(uname -a)

# Cpu Count (Physical And Logical)
PCPU=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
VCPU=$(grep "processor" /proc/cpuinfo| sort | uniq | wc -l)

# Memory Usage
USED_MEM=$(free --mega | grep "Mem:" | awk '{printf $3}')
TOTAL_MEM=$(free --mega | grep "Mem:" | awk '{printf $2"MB"}')
PREC_MEM=$(free --mega | grep "Mem:" | awk '{printf ("%.2f%%", ($3/$2)*100)}')

# Disk usage
USED_DISK=$(df -BM | grep "^/dev/" | awk '{UD += $3} END {printf UD}')
TOTAL_DISK=$(df -BM | grep "^/dev/" | awk '{TD +=$2} END {printf("%d", (TD/1024))}')
PERC_DISK=$(df -BM | grep "^/dev/" | awk '{UD += $3} {TD += $2} END {printf("%.2f%%", (UD/TD)*100)}')

# LVM Usage
LVM=$(lsblk | awk '{print $6}' | grep "lvm" | sort | uniq | wc -l)
LVM_USAGE=$(if [ $LVM -gt 0 ]; then echo "yes"; else echo "no"; fi)

# CPU Load
CPU_LOAD=$(iostat | grep -A 1 "idle" | grep "^ " | awk '{printf("%.1f%%", 100-$6)}')

# Last Boot time
LASTB=$(who -b | awk '{printf $3" "$4}') 

# Establiched TCP connections count
TCP=$(netstat -t | grep "ESTABLISHED" | wc -l)

# logged in users count
USER_COUNT=$(who -u | awk '{print $1}' | uniq | wc -l)

# Network info
IP=$(hostname -I)
MAC=$(ip link | grep "link/ether" | awk '{printf $2}')

# sudo count
SUDO=$(journalctl -q _COMM=sudo | grep -c "COMMAND")

wall "
	Architecture		: $ARCH
	#CPU physical		: $PCPU
	#vCPU			    : $VCPU
	#Memory Usage		: $USED_MEM/$TOTAL_MEM ($PREC_MEM)
	#Disk Usage		    : $USED_DISK/$TOTAL_DISK Gb ($PERC_DISK)
	#CPU load		    : $CPU_LOAD
	#Last boot		    : $LASTB
	#LVM use		    : $LVM_USAGE
	#Connections TCP	: $TCP ESTABLISHED
	#User log:		    : $USER_COUNT
	#Network		    : IP $IP ($MAC)
	#Sudo			    : $SUDO cmd
"
```

The final script should look  something like this.

---

Now let's use crontab to implement the script broadcast every 10 minutes.

crontab is a background process command line tool, used to put for example scripts, or commands.. on a scheduled process.

the crontab configuration works through the `* * * * *` five starts as each mean

1 - Minutes\
2 - Hours\
3 - Day of the month (1 - 31).\
4 - Months\
5 - Day of the week, (0-6) Sunday being (0 or 7).

to specify the script to run every `number of` minutes we use the `*\<NUM>` as 

for example this means , the 10th minute of each hour.

```
10 * * * * /path/to/your/script.sh`
```

And this means every 10 minutes.

```
*/10* * * * * /path/to/your/script.sh`
```

but crontab is systematic in a way that it runs every 10 minutes starting from 00 and not the time the system booted.'

for example if the system booted at 10:09, the crontab will display at 10:10 only one minute after that.

to handle this we will use the `@reboot` directive and execute the script **once** on reboot.

```
@reboot /home/oimzilen/scripts/timer.sh`
```

but here we will call a timer script, which will have an infinite while loop running in the background, that sleeps every `600` seconds, exactly 10 minutes.

```bash
#!/bin/bash
while true;do
	sleep 600
	/home/oimzilen/scripts/monitoring.sh
done
```

this will fix the problem of crontab executing in a systematic 10 20 30 40....

---

### Bonus (lighttpd server) :

we will open a new port for the lighttpd web server.

![](attachment/bd9bd7ddcf392f2f8f63c50bf3497e33.png)

basically lighttpd is a web server that built to be fast and preform-ant, and is perfect for a server hosted from a virtual environment.

we install the lighttpd packages using

```
sudo apt install lighttpd -y
```

we allow the port 80, which is typically the default for lighttpd
```
sudo ufw allow 80
```

check the status using

```
sudo ufw status
```

---

### Configuring WordPress :

### Installing The database (MariaDB) :

(still working on it gonna update it later...)