NAME	= mateothegreat/docker-alpine-nginx-php-fpm
ALIAS	= docker-alpine-nginx-php-fpm
VERSION	= 1.0.0

all:	build

build:

	@echo "Building an image with the current tag $(NAME):$(VERSION).."
	
	docker build 	--rm 	\
					--tag $(NAME):$(VERSION) \
					.

run: stop

	docker run 	--rm -d 				                        \
				--volume $(PWD)/www:/www 						\
				--publish 80:80		                        	\
				--name $(ALIAS)                                 \
				$(NAME):$(VERSION)

stop:

	docker rm -f $(ALIAS) | true

logs:

	docker logs -f $(ALIAS)

shell:

	docker run 	--rm -it 				                        \
				--volume $(PWD)/www:/www 						\
				--publish 80:80		                        	\
				--name $(ALIAS)                                 \
				--entrypoint /bin/sh                            \
				$(NAME):$(VERSION)

tag_latest:

	docker tag $(NAME):$(VERSION) $(NAME):latest

push:

	docker push $(NAME)