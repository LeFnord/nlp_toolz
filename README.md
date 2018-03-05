[![Gem Version](https://badge.fury.io/rb/nlp_toolz.png)](http://badge.fury.io/rb/nlp_toolz)

# NlpToolz

Basic NLP tools, mostly based on [OpenNLP](http://opennlp.apache.org), at this time `sentence finder`, `tokenizer` and `POS tagger` implemented, plus [Berkeley Parser](http://code.google.com/p/berkeleyparser/).

## Installation

Add this line to your application's Gemfile:

    gem 'nlp_toolz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nlp_toolz

## Usage

see: [nlp_toolz.rb](https://github.com/LeFnord/nlp_toolz/blob/master/lib/nlp_toolz.rb) and specs for usage

## Docker

Use this Dockerfile [lefnord/nlp_toolz](https://hub.docker.com/r/lefnord/nlp_toolz/) for local development, it includes the needed jars and models.

- build: `docker build -t lefnord/nlp_toolz .`
- run: `docker run --rm -ti lefnord/nlp_toolz`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Comments

- removed Celluloid, do concurrency in your app, where it be used
- check `load_jars` for JVM parameters
