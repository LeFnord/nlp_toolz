# coding: utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-10-23

# for java usage
require "rjb"

# external requirements
require "awesome_print"
require "multi_json"
require "celluloid"

# internal requirements
require "nlp_toolz/version"
require "nlp_toolz/helpers/url_handler"
require "nlp_toolz/helpers/lang"
require "nlp_toolz/helpers/string_extended"
require "nlp_toolz/helpers/tmp_file"

# NLP Tools
# require "nlp_toolz/load_jars"
require "nlp_toolz/sentences"
require "nlp_toolz/pos_tags"
require "nlp_toolz/tokens"
require "nlp_toolz/parser"

module NlpToolz
  extend Lang
  include Celluloid
  
  MODELS = File.join(File.dirname(__FILE__), '..', "models")
  JARS = File.join(File.dirname(__FILE__), '..', "jars")
  
  CLASS_PATH = [
                 File.join(JARS, "jars/jwnl-1.3.3.jar"),
                 File.join(JARS, "jars/opennlp-tools-1.5.2.jar"),
                 File.join(JARS, "jars/opennlp-maxent-3.0.2.jar")
               ].join(":")
  
  Rjb::load(CLASS_PATH,['-Xmx2048m','-Djava.awt.headless=true'])
  
  def self.get_lang(input)
    NlpToolz.get_language(input)
  end

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
      tagged_text << tag_sentence(sentence,lang)
    end
    
    tagged_text
  end
  
  def self.parse_sentence(input,lang = nil)
    text = NlpToolz::Parser.new(input,lang)
    text.parse_text
    
    text.parse_hash
  end
  
  def self.parse_text(input,lang = nil)
    parsed_text = []
    get_sentences(input,lang).each do |sentence|
      parsed_text << parse_sentence(sentence,lang)
    end
    
    parsed_text
  end
end
