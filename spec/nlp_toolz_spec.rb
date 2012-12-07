# coding: utf-8
require "spec_helper"

describe NlpToolz do
  before(:each) do
    @text = "William Tecumseh Sherman (February 8, 1820 – February 14, 1891) was an American soldier, businessman, educator, and author.
             He served as a general in the United States Army during the American Civil War (1861–65), receiving both recognition for his outstanding command of military strategy, and criticism for the harshness of the scorched earth policies he implemented in conducting total war against the Confederate States of America.
             Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
    @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
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
  
  describe "tagging" do
    it "should tag a sentence" do
      sentence = NlpToolz.get_sentences(@text).last
      tags = NlpToolz.tag_sentence(sentence)
      tags[:token].length.should == tags[:tag].length
    end
    
    it "should be 'nil', if sentence language not supported " do
      tags = NlpToolz.tag_sentence(@g_text)
      tags.should be_nil
    end
    
    it "should tag a whole text" do
      tagged_sentences = NlpToolz.tag_text(@text)
      tagged_sentences.should have(3).items
      tagged_sentences.should be_a Array
      tagged_sentences.first.should be_a Hash
      tagged_sentences.first[:token].length.should == tagged_sentences.first[:tag].length
    end
  end
end