#!/bin/bash
apt update
apt install -y apache2 awscli

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Set S3 Bucket Name
S3_BUCKET="s3://frepingonsalvese-terraform-pro/logs"

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2

# Create a simple HTML file with the instance ID
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
</body>
</html>
EOF

# Configure log rotation and upload logs every 5 minutes
cat <<EOF > /etc/cron.d/upload_logs
*/5 * * * * root aws s3 cp /var/log/apache2/access.log $S3_BUCKET/access-\$(date +\%F-\%T).log
*/5 * * * * root aws s3 cp /var/log/apache2/error.log $S3_BUCKET/error-\$(date +\%F-\%T).log
EOF

# Restart cron to apply changes
systemctl restart cron
