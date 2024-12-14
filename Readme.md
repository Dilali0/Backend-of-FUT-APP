# Setting Up a PHP Project with Docker Using PDO and MySQLi Drivers

The `my_php_project` directory is the location where your PHP project files will reside. This directory is mounted as a volume in the Docker container and maps to `/var/www/html` inside the PHP container. Here are the key details:

- Place all your PHP project files, such as `.php` scripts, assets (like CSS, JavaScript), and HTML templates, inside `my_php_project`.
- Any changes made in this directory on your host machine will automatically reflect in the Docker container.
- Example 
- Access the project via `http://localhost/` in your browser.

## directory structure:

  ```
  docker-compose.yaml
  |
  php/
  ├── Dockerfile
  my_php_project/
  ├── index.php
  ├── phpinfo.php
  └── assets/
      ├── styles.css
      └── script.js
  ```
  
## 1. Create the Docker Environment

### `docker-compose.yml`

```yaml 
version: "3.8"
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: your_database
      MYSQL_USER: user
      MYSQL_PASSWORD: user_password
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin_container
    restart: always
    environment:
      PMA_HOST: mysql
      MYSQL_ROOT_PASSWORD: root_password
    ports:
      - "8080:80"

  php:
    build:
      context: ./php
      dockerfile: Dockerfile
    container_name: php_container
    restart: always
    volumes:
      - ./my_php_project:/var/www/html
    ports:
      - "80:80"

volumes:
  mysql_data:
```

## 2. Create the Dockerfile

Inside a `php` folder, create a `Dockerfile` with the following content:

``` yaml
FROM php:8.2-apache

# Install PDO MySQL and MySQLi extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache mod_rewrite
RUN a2enmod rewrite
```

## 3. Build and Start the Docker Containers

- Run the following commands to build and start the containers:
  ```bash
  docker-compose build php
  docker-compose up -d
  ```

- Check the running containers using:
  ```bash
  docker ps
  ```

## 4. Verify PHP Extensions

1. Create a `phpinfo.php` file in your project directory:

```php
<?php
phpinfo();
?>
```

2. Access it in your browser at `http://localhost/phpinfo.php`.
3. Confirm that both `PDO` and `mysqli` extensions are installed.

## 5. Test Database Connections

### PDO Connection Test

```php
<?php
$dsn = 'mysql:host=mysql;dbname=your_database;charset=utf8';
$username = 'user';
$password = 'user_password';

try {
    $pdo = new PDO($dsn, $username, $password);
    echo "PDO connection successful!";
} catch (PDOException $e) {
    echo "PDO connection failed: " . $e->getMessage();
}
?>
```

### MySQLi Connection Test

```php
<?php
$host = 'mysql';
$username = 'user';
$password = 'user_password';
$database = 'your_database';

$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_error) {
    die("MySQLi connection failed: " . $mysqli->connect_error);
}
echo "MySQLi connection successful!";
?>
```

Place these PHP scripts in the `my_php_project` folder and access them via `http://localhost/test_pdo.php` or `http://localhost/test_mysqli.php`.

## 6. Notes

- Ensure the database credentials in the PHP scripts match those defined in the `docker-compose.yml` file.
- Use `phpmyadmin` at `http://localhost:8080` to manage your database visually.
