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
        expect(text).to respond_to(:input)
        expect(text).to respond_to(:lang)
        expect(text).to respond_to(:model_name)
        expect(text).to respond_to(:model)
        expect(text).to respond_to(:parse_hash)
      end
    end

    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::Parser.new(@text,'en')
        expect(sent.model_name).to be == 'en-sm5.gr'
        expect(sent.has_model?).to be_truthy
      end

      it "should not have a model, if lang not known" do
        sent = NlpToolz::Parser.new(@g_text)
        expect(sent.has_model?).to be_falsey
      end
    end

    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::Parser.new(@text,"en") }.to_not raise_error
      end

      it "should set the language of input" do
        text = NlpToolz::Parser.new(@text)
        expect(text.lang).to be == "en"
      end

      it "should build the right model name" do
        text = NlpToolz::Parser.new(@text)
        expect(text.model_name).to be == "en-sm5.gr"
      end
    end

    describe "parsing" do
      it "should store tree in a hash" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        expect(text.parse_hash).to be_a(Hash)
      end

      it "should have a token hash after parsing" do
        text = NlpToolz::Parser.new(@text)
        text.parse_text
        expect(text.layer).to be_a Hash
        expect(text.layer).to include(:tags)
        expect(text.layer).to include(:tokens)
      end
    end
  end # Parser
end # NlpToolz
