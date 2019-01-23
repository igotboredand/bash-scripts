# install go.

# Download Tar file, check it's 

#!/bin/bash

user_home=$HOME

go_download_link="https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz"

cd /tmp
# clean up /usr/local/go, download Go 1.10.3 from the googs, uncompress into /usr/local 
echo 'Removing /usr/local/go, sudo is required.'
# Make sure there's no currently installed go version in /usr/local/go. 
sudo rm -fr /usr/local/go
echo 'Downloading go1.11.4'
wget $go_download_link
# HARDCODED: Verification sha256 sum, pull this from go's download section of the website. 
go_sha256="fb26c30e6a04ad937bbc657a1b5bba92f80096af1e8ee6da6430c045a8db3a5b"
# HARDCODED: file name.
downloaded_sum=$(sha256sum go1.11.4.linux-amd64.tar.gz|awk {'print $1'})

if [[ "$downloaded_sum" = "$go_sha256" ]]
then
	echo "The downloaded file passed SHA256 verification."

	# HARDCODED: file name
	sudo tar -xz -C /usr/local -f go1.11.4.linux-amd64.tar.gz
	echo "go installed, configuring profile and go folder."
	# Set up environmental variables, source from .profile to ensure that they will persist across reboots.
	echo "PATH=$PATH:/usr/local/go/bin" >> $user_home/.profile
	mkdir $user_home/go
	echo "GOPATH=$user_home/go" >> $user_home/.profile
	echo "Your go folder is: "$user_home"/go"
	source $user_home/.profile
	echo `go version` "installed."  # test that the new version is printed out


	# HARDCODED: file name
	rm /tmp/go1.11.4.linux-amd64.tar.gz


else
	echo "The downloaded file's SHA256 and the hardcoded SHA256 sum for the file do not match."
fi