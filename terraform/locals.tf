locals {
  ec2_user_data_base = <<-END_OF_FILE
#!/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker

yum install git -y
END_OF_FILE
}
