# coding: utf-8
require "spec_helper"

describe NlpToolz do
  before(:each) do
    @sentence = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author."
    @text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author. He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America. Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
    @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
  end

  describe "detect language" do
    it "should description" do
      lang = NlpToolz.get_lang(@text)
      lang.should == 'en'
    end
  end
  
  describe "sentence detection" do
    it "should input text split into its sentences" do
      sentences = NlpToolz.get_sentences(@text)
      sentences.should have(3).items
    end
    
    it "should be 'nil', if text lang is unsupported" do
      sentences = NlpToolz.get_sentences(@g_text)
      sentences.should be_nil
    end
  end
  
  describe "tokenizing" do
    it "should tag a sentence" do
      tokens = NlpToolz.tokenize_sentence(@sentence)
      tokens.should have(26).items
      tokens.should be_a Array
    end
    
    it "should tokenize a whole text" do
      token_arr = NlpToolz.tokenize_text(@text)
      token_arr.should have(3).items
      token_arr.first.should have(26).items
    end
  end
  
  describe "tagging" do
    it "should tag a sentence" do
      sentence = NlpToolz.get_sentences(@sentence).last
      tags = NlpToolz.tag_sentence(sentence)
      tags[:tokens].length.should == tags[:tags].length
    end
    
    it "should be 'nil', if sentence language not supported " do
      tags = NlpToolz.tag_sentence(@g_text)
      tags.should be_nil
    end
  end
  
  describe "parsing" do
    it "should parse a sentence" do
      sentence = NlpToolz.get_sentences(@sentence).last
      parsed = NlpToolz.parse_sentence(sentence)
      parsed.should be_a Hash
    end
    
    it "should should be 'nil', if sentence language is not supported" do
      parsed = NlpToolz.parse_sentence(@g_text)
      parsed.should be_nil
    end
  end
end
