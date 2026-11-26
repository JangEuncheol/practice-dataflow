locals {
  ec2_user_data_base = <<-END_OF_FILE
#!/bin/bash
apt-get update -y
apt-get install docker.io -y
systemctl enable docker
systemctl start docker

apt-get install git -y
END_OF_FILE
}
