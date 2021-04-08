

# Documentation

## Create vagrant file

```vagrant init ubuntu/focal64```

## Connect to vagrant box

```vagrant ssh```

## Install java

```sudo apt install default-jre```

## Install Repository Keys

```wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -```

```sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'```

```sudo apt update```

```sudo apt install jenkins```

```systemctl start jenkins```
