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
        expect(text).to respond_to(:input)
        expect(text).to respond_to(:lang)
        expect(text).to respond_to(:model_name)
        expect(text).to respond_to(:model)
        expect(text).to respond_to(:tokens)
      end
    end

    describe "model" do
      it "should have a model, if lang 'en'" do
        sent = NlpToolz::Tokens.new(@text,'en')
        expect(sent.has_model?).to be_truthy
      end

      it "should not have a model, if lang not known" do
        sent = NlpToolz::Tokens.new(@g_text)
        expect(sent.has_model?).to be_falsey
      end
    end

    describe "object" do
      it "should create a valid object" do
        expect{ text = NlpToolz::Tokens.new(@text,"en") }.to_not raise_error
      end

      it "should set the language of input" do
        text = NlpToolz::Tokens.new(@text)
        expect(text.lang).to be == "en"
      end

      it "should build the right model name" do
        text = NlpToolz::Tokens.new(@text)
        expect(text.model_name).to be == "en-token.bin"
      end

      it "should be a arrar after tokenizing" do
        text = NlpToolz::Tokens.new(@text,"en")
        text.tokenize
        expect(text.tokens).to be_a Array
      end

      it "should tokenize given text" do
        text = NlpToolz::Tokens.new(@text,"en")
        text.tokenize
        expect(text.tokens.length).to be == 15
      end
    end
  end # Tokens
end # NlpToolz
