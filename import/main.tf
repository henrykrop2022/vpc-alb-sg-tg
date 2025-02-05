provider "aws" {
    region = "us-east-1"
    # profile = "default"
}

import {
  to = aws_instance.web
  id = "i-030c47cbca99ac77e"
}
