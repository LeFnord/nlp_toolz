# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "tokens" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
    end
    
    describe "attributes" do
      it "should respond to 'input'" do
        text = NlpToolz::Tokens.new(@text)
        text.should respond_to(:input)
      end
      
      it "should respond to 'lang'" do
        text = NlpToolz::Tokens.new(@text)
        text.should respond_to(:lang)
      end
      
      it "should respond to 'model_name'" do
        text = NlpToolz::Tokens.new(@text)
        text.should respond_to(:model_name)
      end
      
      it "should respond to 'model_name'" do
        text = NlpToolz::Tokens.new(@text)
        text.should respond_to(:tokens)
      end
    end
    
    it "should create a valid object" do
      expect{ text = NlpToolz::Tokens.new(@text,"en") }.to_not raise_error
    end
    
    it "should set the language of input" do
      text = NlpToolz::Tokens.new(@text)
      text.lang.should == "en"
    end
    
    it "should build the right model name" do
      text = NlpToolz::Tokens.new(@text)
      text.model_name.should == "en-token.bin"
    end
    
    it "should not raise an error, if model file exists" do
      expect{ text = NlpToolz::Tokens.new(@text) }.to_not raise_error
    end
    
    it "should raise an error, if model file not exists" do
      expect{ text = NlpToolz::Tokens.new(@g_text) }.to raise_error('file not found')
    end
    
    it "should be a arrar after tokenizing" do
      text = NlpToolz::Tokens.new(@text,"en")
      text.tokenize
      text.tokens.should be_a Array
    end
    
    it "should tokenize given text" do
      text = NlpToolz::Tokens.new(@text,"en")
      text.tokenize
      text.tokens.should have(15).items
    end
  end
end