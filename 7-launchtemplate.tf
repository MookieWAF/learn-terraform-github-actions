resource "aws_launch_template" "tacoTuesday-LT-80" {
  name_prefix   = "tacoTuesday-LT-80"
  image_id      = "ami-046b5b8111c19b3ac"
  instance_type = "t2.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.tacoTuesday-TG01-SG01-80.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for port 80 EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Taco Truck Troupe</h1>
    <h1>Trucks parked in port 80 in Oregon</h1>
    <div class="tenor-gif-embed" data-postid="12634098" data-share-method="host" data-aspect-ratio="2.18493" data-width="40%"><a href="https://tenor.com/view/funny-meme-taco-day-to-the-taco-truck-gif-12634098">Funny Meme Taco Day GIF</a>from <a href="https://tenor.com/search/funny+meme-gifs">Funny Meme GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "tacoTuesday-LT-80"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}




resource "aws_launch_template" "tacoTuesday-LT-443" {
  name_prefix   = "tacoTuesday-LT-443"
  image_id      = "ami-046b5b8111c19b3ac"
  instance_type = "t2.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.tacoTuesday-TG02-SG01-443.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for port 443 EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Class 6 is secure</h1>
    <h1>She's cooking you tacos, somewhere in Oregon</h1>
    <div class="tenor-gif-embed" data-postid="20449377" data-share-method="host" data-aspect-ratio="0.5625" data-width="40%"><a href="https://tenor.com/view/abell46s-reface-sexy-sensual-seductive-gif-20449377">Abell46s Reface GIF</a>from <a href="https://tenor.com/search/abell46s-gifs">Abell46s GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <br>
    <h1>Theo's taco ladies...</h1>
    <div class="tenor-gif-embed" data-postid="13913610" data-share-method="host" data-aspect-ratio="1.23932" data-width="40%"><a href="https://tenor.com/view/ring-girls-ukraine-%D1%83%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B0-lomachenko-top-rank-gif-13913610">Ring Girls Ukraine GIF</a>from <a href="https://tenor.com/search/ring+girls-gifs">Ring Girls GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <br>
    <div class="tenor-gif-embed" data-postid="25373271" data-share-method="host" data-aspect-ratio="0.5625" data-width="40%"><a href="https://tenor.com/view/slava-ukraini-ukraine-ukraina-ukrainian-gif-25373271">Slava Ukraini GIF</a>from <a href="https://tenor.com/search/slava-gifs">Slava GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "tacoTuesday-LT-443"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
