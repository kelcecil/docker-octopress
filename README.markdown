#docker-octopress
##docker image for octopress behind gwan using ruby 2.2

This is a Docker image for Octopress inspired by the way the golang-onbuild Docker image works. docker-octopress uses Debian Jessie and includes Ruby 2.2 and gwan for serving the generated static content on port 80.

The docker-octopress image will take the your code, generate your blog, and stick them into an image for the content to be served by gwan on port 80.

###Usage

The docker-octopress image is hosted and ready to go on DockerHub, so all you have to do is to use the base image within your Dockerfile in the root of your repository.

```
FROM kelcecil/docker-octopress
```

The image will include your repository into the image and run rake generate. The generated public folder is served by gwan.

You can then launch your blog quite easily:

```
docker run -d -p 80:80 <insert image here>
```

###Contributing

I love pull requests, and I'd love to have yours! Just fork the repo, make a branch and your changes, and make a PR targeting master.

###License

Released under MIT license. Check the LICENSE FILE.
