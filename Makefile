delete_cache:
	rm -rf .jekyll-cache
install:
	gem install jekyll bundler
serve: 	
	bundle exec jekyll serve --host=0.0.0.0
watch:
	bundle exec jekyll serve --host=0.0.0.0 --watch --force_polling --verbose
start_docker:	
	rm -rf .jekyll-cache
	docker-compose up -d
update_docker:
	rm -rf .jekyll-cache
	docker-compose stop
	docker-compose rm -f
	docker-compose pull
	docker-compose up -d --build
docker-start:
	docker-compose start
docker-stop:
	docker-compose stop
