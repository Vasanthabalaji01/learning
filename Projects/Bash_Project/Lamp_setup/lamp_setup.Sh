#!/bin/bash

# Step 1: Install Apache, MySQL, and PHP
sudo apt-get update
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y

# Step 2: Configure Apache
sudo sed -i 's/\/var\/www\/html/\/var\/www\/html\/public/g' /etc/apache2/sites-available/000-default.conf

# Step 3: Enable Apache modules
sudo a2enmod rewrite
sudo systemctl restart apache2

# Step 4: Configure MySQL
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';
FLUSH PRIVILEGES;
EXIT;
EOF

echo "LAMP server setup is complete!"
