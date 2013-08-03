# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "Parser" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
    end
    
    describe "attributes" do
      it "should respond to #attribute" do
        text = NlpToolz::Parser.new(@text)
        text.should respond_to(:input)
        text.should respond_to(:lang)
        text.should respond_to(:model_name)
        text.should respond_to(:model)
        text.should respond_to(:parse_hash)
      end
    end
    
    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::Parser.new(@text,'en')
        sent.model_name.should == 'en-sm5.gr'
        sent.has_model?.should be_true
      end
      
      it "should not have a model, if lang not known" do
        sent = NlpToolz::Parser.new(@g_text)
        sent.has_model?.should be_false
      end
    end
    
    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::Parser.new(@text,"en") }.to_not raise_error
      end
      
      it "should set the language of input" do
        text = NlpToolz::Parser.new(@text)
        text.lang.should == "en"
      end
      
      it "should build the right model name" do
        text = NlpToolz::Parser.new(@text)
        text.model_name.should == "en-sm5.gr"
      end
    end

    describe "parsing" do
      it "should store tree in a hash" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        text.parse_hash.should be_a(Hash)
      end

      it "should have a token hash after parsing" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        text.layer.should be_a Hash
        text.layer.should include(:tags)
        text.layer.should include(:tokens)
      end
    end
  end # Parser
end # NlpToolz
