<<<<<<< HEAD
upgrade:
=======
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
>>>>>>> 24ef88f52d54c7da1b6e0c3b4b0f97786eb7dbe9
	docker-compose stop
	docker-compose rm -f
	docker-compose pull
	docker-compose up -d --build
<<<<<<< HEAD
=======

>>>>>>> 24ef88f52d54c7da1b6e0c3b4b0f97786eb7dbe9
