#docker-octopress
##docker image for octopress behind gwan using ruby 2.2

This is a Docker image for Octopress inspired by the way the golang-onbuild Docker image works. docker-octopress uses Debian Jessie and includes Ruby 2.2 and gwan for serving the generated static content on port 80.

The docker-octopress image will take the your code, generate your blog, and stick them into an image for the content to be served by gwan on port 80.

Versions are available for both Octopress 2 and 3.

###Usage

The docker-octopress image is hosted and ready to go on DockerHub, so all you have to do is to use the base image within your Dockerfile in the root of your repository.

If you're using Octopress V2:
```
FROM kelcecil/octopress:v2
```

If you're using Octopress V3:
```
FROM kelcecil/octopress:v3
```

The latest tag uses v2 since Octopress 3 is still beta.

The image will include your repository into the image and run rake generate (V2)/jekyll build(V3). The generated public folder is served by gwan.

You can then launch your blog quite easily:

```
docker run -d -p 80:80 <insert image here>
```

###Contributing

I love pull requests, and I'd love to have yours! Just fork the repo, make a branch and your changes, and make a PR targeting master.

###License

Released under MIT license. Check the LICENSE FILE.
