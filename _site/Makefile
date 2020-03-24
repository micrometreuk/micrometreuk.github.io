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
docker-start:
	docker-compose start
docker-stop:
	docker-compose stop
rebuild_repo:	
	git pull
	docker-compose stop
	docker-compose start

