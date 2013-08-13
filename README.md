# NlpToolz

Basic NLP tools, mostly based on OpenNLP, at this time `sentence finder`, `tokenizer` and `POS tagger` implemented.
Plus Berkeley Parser.

## Installation

Add this line to your application's Gemfile:

    gem 'nlp_toolz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nlp_toolz

Download [OpenNLP](http://opennlp.apache.org/cgi-bin/download.cgi) and move opennlp-tools-1.5.3.jar, *-maxent-3.0.3.jar and jwnl-1.3.3.jar into jar folder, also for [BerkeleyParser](http://code.google.com/p/berkeleyparser/downloads/list).

## Usage

see: [nlp_toolz.rb](https://github.com/LeFnord/nlp_toolz/blob/master/lib/nlp_toolz.rb) and specs for usage

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
