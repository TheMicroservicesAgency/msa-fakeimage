
# msa-fakeimage

Dynamic image generator. Can generate png, jpg and gif images at various resolutions.

Built with the [fakeimage](https://github.com/xxx/fakeimage) ruby app.

## Quick start

Execute the microservice container with the following command :

    docker run -ti -p 9905:80 msagency/msa-fakeimage

## Example(s)

To get a png image of dimensions 850x50, just specify the size (width x height) in the url :

[/fakeimage/850x100.png](/fakeimage/850x100.png)

![Example 1](http://demo.microservices.agency:9905/fakeimage/850x100)

Specify the background color with the `color` parameter, specify either a color name (the full list is available on the [imagemagick ](http://www.imagemagick.org/script/color.php#color_names) website) :

[/fakeimage/850x100.png?color=DeepSkyBlue](/fakeimage/850x100.png?color=DeepSkyBlue)

![Example 2](http://demo.microservices.agency:9905/fakeimage/850x100.png?color=DeepSkyBlue)

Or you can use a hex code, starting with `!` instead of `#` :

[/fakeimage/50x500.jpg?color=!4bfc57](fakeimage/850x100.jpg?color=!4bfc57)

![Example 3](http://demo.microservices.agency:9905/fakeimage/850x100.jpg?color=!4bfc57)

You can also change the text color with the `textcolor` parameter :

[/fakeimage/850x100.jpg?color=black&textcolor=!43ff00](/fakeimage/850x100.jpg?color=black&textcolor=!43ff00)

![Example 4](http://demo.microservices.agency:9905/fakeimage/850x100.jpg?color=black&textcolor=!43ff00)

## Endpoints

- GET [/fakeimage/:resolution](/fakeimage/500x500) : Returns a png image
- GET [/fakeimage/:resolution.png](/fakeimage/500x500.png) : Returns a png image
- GET [/fakeimage/:resolution.jpg](/fakeimage/500x500.jpg)  : Returns a jpg image
- GET [/fakeimage/:resolution.gif](/fakeimage/500x500.gif)  : Returns a gif image


## Standard endpoints

- GET [/ms/version](/ms/version) : returns the version number
- GET [/ms/name](/ms/name) : returns the name
- GET [/ms/readme.md](/ms/readme.md) : returns the readme (this file)
- GET [/ms/readme.html](/ms/readme.html) : returns the readme as html
- GET [/swagger/swagger.json](/swagger/swagger.json) : returns the swagger api documentation
- GET [/swagger/#/](/swagger/#/) : returns swagger-ui displaying the api documentation
- GET [/nginx/stats.json](/nginx/stats.json) : returns stats about Nginx
- GET [/nginx/stats.html](/nginx/stats.html) : returns a dashboard displaying the stats from Nginx

## About

A project by the [Microservices Agency](http://microservices.agency).
