bundle_install:
	gem install jekyll bundler
	bundle install
bundle_serve: 	
	bundle exec jekyll serve --host=0.0.0.0
bundle_watch:
	bundle exec jekyll serve --host=0.0.0.0 --watch --force_polling --verbose
docker_up:	
	rm -rf .jekyll-cache
	docker-compose up -d
docker_upgrade:
	rm -rf .jekyll-cache
	docker-compose stop
	docker-compose rm -f
	docker-compose pull
	docker-compose up -d --build
docker_start:
	docker-compose start
docker_stop:
	docker-compose stop
docker_restart:	
	git pull
	docker-compose stop
	docker-compose start

push_to_gitea:
	git add .
	git commit -m "Pushing to Gitea"
	git push -u origin master
push_to_droplet:
	git add .
	git commit -m "Pushing to Droplet for deployment"
	git push -u droplet master
