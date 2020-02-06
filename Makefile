install:
	rm -rf .jekyll-cache
	gem install jekyll bundler
serve: 	
	rm -rf .jekyll-cache
	bundle exec jekyll serve
watch:
	rm -rf .jekyll-cache
	bundle exec jekyll serve --watch --force_polling --verbose
start_docker:	
	rm -rf .jekyll-cache
	docker-compose up -d
update_docker:
	rm -rf .jekyll-cache
	docker-compose stop
	docker-compose rm -f
	docker-compose pull
	docker-compose up -d --build

