# coding: utf-8
require "spec_helper"

describe NlpToolz do
  describe "POS Tags" do
    before(:each) do
      @text = "Military historian Basil Liddell Hart famously declared that Sherman was the first modern general."
      
      @g_text = "μακεδονικού εκκεντροφόρου πολιτισμός του. την ανάφλεξης πολιτισμική. πολιτισμού του να. τόπος επειδή σε. καθορίσουν χρόνια Στα από."
      @d_text = "Kitaro Nishidas Text 'Die Welt der Physik' wurde zuerst 1944 in Januar in der Zeitschrift „Shisô“ Nr. 260 und erneut 1945, als ein Teil des Buches „Tetsugaku-ronbun-shû (Philosophische Aufsätzesammlung/Schriftsammlung) 6“ veröffentlicht."
    end
    
    describe "attributes" do
      it "should respond to 'input'" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:input)
      end
      
      it "should respond to 'lang'" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:lang)
      end
      
      it "should respond to 'model_name'" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:model_name)
      end
      
      it "should respond to 'model'" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:model)
      end
      
      it "should respond to 'tags'" do
        text = NlpToolz::PosTags.new(@text)
        text.should respond_to(:tagged_tokens)
      end
    end
    
    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::PosTags.new(@text,'en')
        sent.has_model?.should be_true
      end
      
      it "should not have a model, if lang not known" do
        sent = NlpToolz::PosTags.new(@g_text)
        sent.has_model?.should be_false
      end
    end
    
    
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
      text.tagged_tokens.should be_a Hash
    end
    
    it "should get pos text of given text" do
      text = NlpToolz::PosTags.new(@text,"en")
      text.get_pos_tags
      text.tagged_tokens[:token].should have(15).items
    end
    
    it "should have same count of tokens and tags" do
      text = NlpToolz::PosTags.new(@d_text,"de")
      text.get_pos_tags
      text.tagged_tokens[:token].length.should == text.tagged_tokens[:tag].length
    end
  end
end
