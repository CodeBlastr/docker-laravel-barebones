# Laravel Docker Barebones
You don't need to install composer, or npm or anything else except for Docker on your local machine. Just clone this repo and run .install.sh, and all dependencies are handled. 

Made this because every other installation required that you install composer on your host machine, or install npm on your host machine, or even sometimes install php on your host machine... and I couldn't stand it. The whole purpose of Docker is that you don't need to install dependencies on your host machine. Geez.   

## Installation

```php
git clone git@github.com:CodeBlastr/docker-laravel-barebones.git my-app
cd my-app
./install.sh
```

## Shut down
```php
./vendor/bin/sail down
```

### Troubleshooting
- if ./install.sh gives you an error you might need permissions update to make it executable
- chmod u+x install.sh


- DB_HOST would not connect, so I ran this command
- ```docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' deltaphoenix-pgsql-1```
- which gave me the ip that I used for the DB_HOST variable in the .env file
- then ran ```./vendor/bin/sail artisan migrate```
