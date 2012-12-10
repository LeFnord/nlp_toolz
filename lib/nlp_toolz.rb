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

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'jars'))

module NlpToolz
  MODELS = File.join(File.dirname(__FILE__), '..', "models")
  
  def self.get_sentences(input,lang = nil)
    text = NlpToolz::Sentences.new(input,lang)
    text.split_into_sentences if text.has_model?
  end
  
  def self.tag_sentence(input,lang = nil)
    sentence = NlpToolz::PosTags.new(input,lang)
    sentence.get_pos_tags if sentence.has_model?
  end
  
  def self.tag_text(input,lang = nil)
    tagged_text = []
    get_sentences(input,lang).each do |sentence|
      tagged_text << tag_sentence(sentence)
    end
    
    tagged_text
  end
end
