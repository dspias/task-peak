#-----------------------------------------------------------
# Docker
#-----------------------------------------------------------

# Wake up docker containers
up:
	docker-compose up -d

# Shut down docker containers
down:
	docker-compose down

# Show a status of each container
status:
	docker-compose ps

# Status alias
s: status

# Show logs of each container
logs:
	docker-compose logs

app-logs:
	docker-compose logs -f app

# Restart all containers
restart: down up

# Restart the app container
restart-app:
	docker-compose restart app

# Restart the frontend container alias
rc: restart-app

# Build and up docker containers
build:
	docker-compose up -d --build

# Build containers with no cache option
build-no-cache:
	docker-compose build --no-cache

# Build and up docker containers
rebuild: down build

# Run terminal of the next container
next:
	docker-compose exec app /bin/sh



#-----------------------------------------------------------
# Database
#-----------------------------------------------------------

# Run database migrations
db-push:
	docker-compose exec app npx prisma db push

#-----------------------------------------------------------
# Dependencies
#-----------------------------------------------------------


# Update yarn dependencies
npm-install:
	docker-compose exec app npm install


#-----------------------------------------------------------
# Installation
#-----------------------------------------------------------

# Copy the environment file
env:
	cp .env.example .env


# Install the environment
install: build env npm-install rc


#-----------------------------------------------------------
# Git commands
#-----------------------------------------------------------

git-undo:
	git reset --soft HEAD~1

git-wip:
	git add .
	git commit -m "WIP"
