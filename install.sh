#!/bin/bash
RED="\033[0;31m"
GREEN="\033[1;32m"
NC="\033[0m" # No Color

echo "Step 1: preparing to install"
cp .env.example .env
echo -e "${GREEN}Success: env file created${NC}"
sleep 1s

echo "Step 2: init the project with composer"
docker-compose --f ./docker-compose.init.yml up
echo -e "${GREEN}Success: composer installed in docker container${NC}"

echo "Step 3: get rid of composer container we don not need you now"
docker-compose down --remove-orphans
docker rm $(docker ps -a -f status=exited -f status=created -q)
echo -e "${GREEN}Success: composer container removed${NC}"

echo "Step 4: installing inside docker with sail"
./vendor/bin/sail up -d
echo -e "${GREEN}Success: docker environment created${NC}"

echo "Step 5: generate an app key"
./vendor/bin/sail artisan key:generate
echo -e "${GREEN}Success: app key generated${NC}"

echo "Step 6: generate an app key"
./vendor/bin/sail artisan key:generate
echo -e "${GREEN}Success: app key generated${NC}"

echo "Step 7: migrate"
./vendor/bin/sail artisan migrate
echo -e "${GREEN}Success: database migrated and seeded${NC}"

echo "Step 8: open site in browser"
echo -e "${GREEN}Success: Visit http://localhost${NC}"
