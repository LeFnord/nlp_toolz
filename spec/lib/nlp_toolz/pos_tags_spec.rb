# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "POS Tags" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
    end
    
    describe "attributes" do
      it "should respond to #attribute" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:input)
        text.should respond_to(:lang)
        text.should respond_to(:model_name)
        text.should respond_to(:model)
        text.should respond_to(:tokenized)
      end
    end
    
    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::PosTags.new(@text,'en')
        sent.model_name.should == 'en-pos-maxent.bin'
        sent.has_model?.should be_true
      end
      
      it "should not have a model, if lang not known" do
        sent = NlpToolz::PosTags.new(@g_text)
        sent.has_model?.should be_false
      end
    end
    
    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::PosTags.new(@text,"en") }.to_not raise_error
      end
      
      it "should set the language of input" do
        text = NlpToolz::PosTags.new(@text)
        text.lang.should == "en"
      end
      
      it "should build the right model name" do
        text = NlpToolz::PosTags.new(@text)
        text.model_name.should == "en-pos-maxent.bin"
      end
      
      it "should be a hash after pos tagging" do
        text = NlpToolz::PosTags.new(@text,"en")
        text.get_pos_tags
        text.tokenized.should include(:tokens)
        text.tokenized.should include(:tags)
        text.tokenized.should be_a Hash
      end
      
      it "should get pos text of given text" do
        text = NlpToolz::PosTags.new(@text,"en")
        text.get_pos_tags
        text.tokenized[:tokens].should have(15).items
        text.tokenized[:tags].should have(15).items
        text.tokenized[:tokens].length.should == text.tokenized[:tags].length
      end
    end
  end # POS Tags
end # NlpToolz
