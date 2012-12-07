# coding: utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-10-23

# for java usage
# require "java"
require "rjb"

# external requirements
require "awesome_print"
require "multi_json"

# internal requirements
require "nlp_toolz/version"
require "nlp_toolz/helpers/url_handler"
require "nlp_toolz/helpers/lang"
require "nlp_toolz/helpers/string_extended"

# NLP Tools
require "nlp_toolz/sentences"
require "nlp_toolz/pos_tags"
require "nlp_toolz/tokens"


module NlpToolz
  MODELS = File.join(File.dirname(__FILE__), '..', "models")
  
  def self.get_sentences(input)
    text = NlpToolz::Sentences.new(input)
    text.split_into_sentences
  end
  
  
end
