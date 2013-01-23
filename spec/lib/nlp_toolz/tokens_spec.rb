# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "Tokens" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
    end
    
    describe "attributes" do
      it "should respond to #attribute" do
        text = NlpToolz::Tokens.new(@text)
        text.should respond_to(:input)
        text.should respond_to(:lang)
        text.should respond_to(:model_name)
        text.should respond_to(:model)
        text.should respond_to(:tokens)
      end
    end
    
    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::Tokens.new(@text,'en')
        sent.has_model?.should be_true
      end
      
      it "should not have a model, if lang not known" do
        sent = NlpToolz::Tokens.new(@g_text)
        sent.has_model?.should be_false
      end
    end
    
    describe "object" do
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
  end # Tokens
end # NlpToolz
