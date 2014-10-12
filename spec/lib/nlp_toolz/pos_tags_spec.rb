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
        expect(text).to respond_to(:input)
        expect(text).to respond_to(:lang)
        expect(text).to respond_to(:model_name)
        expect(text).to respond_to(:model)
        expect(text).to respond_to(:tokenized)
      end
    end

    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::PosTags.new(@text,'en')
        expect(sent.model_name).to be == 'en-pos-maxent.bin'
        expect(sent.has_model?).to be_truthy
      end

      it "should not have a model, if lang not known" do
        sent = NlpToolz::PosTags.new(@g_text)
        expect(sent.has_model?).to be_falsey
      end
    end

    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::PosTags.new(@text,"en") }.to_not raise_error
      end

      it "should set the language of input" do
        text = NlpToolz::PosTags.new(@text)
        expect(text.lang).to be == "en"
      end

      it "should build the right model name" do
        text = NlpToolz::PosTags.new(@text)
        expect(text.model_name).to be == "en-pos-maxent.bin"
      end

      it "should be a hash after pos tagging" do
        text = NlpToolz::PosTags.new(@text,"en")
        text.get_pos_tags
        expect(text.tokenized).to include(:tokens)
        expect(text.tokenized).to include(:tags)
        expect(text.tokenized).to be_a Hash
      end

      it "should get pos text of given text" do
        text = NlpToolz::PosTags.new(@text,"en")
        text.get_pos_tags
        expect(text.tokenized[:tokens].length).to be == text.tokenized[:tags].length
      end
    end
  end # POS Tags
end # NlpToolz
