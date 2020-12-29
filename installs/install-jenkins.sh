wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install jenkins software-properties-common oracle-java8-installer
sudo systemctl start jenkins
sudo systemctl status jenkins
