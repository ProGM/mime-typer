MIME Typer
==================

A simple library to detect mime type of a file, using libmagic

## Installation: ##
Add this line in your Gemfile

    gem 'mime-typer'

## Run tests: ##

    bundle exec rake

## Requirements: ##
It requires both [awk](http://en.wikipedia.org/wiki/AWK) and [file](http://en.wikipedia.org/wiki/File_(command)) to be installed and available in your `PATH`. Installation will fail if you miss them.


## How to use: ##

    MIME::Typer.detect('path/to/my/image.jpg') # => 'image/jpg'

You can also pass an already opened file:

    myfile = File.open('path/to/my/image.jpg')
    MIME::Typer.detect(myfile) # => 'image/jpg'
