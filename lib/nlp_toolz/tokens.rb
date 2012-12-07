# coding:  utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-11-30

module NlpToolz
  class Tokens
    include Lang
    
    Rjb::load("jars/opennlp-tools-1.5.2.jar:jars/opennlp-maxent-3.0.2.jar",['-Xmx1024m','-Djava.awt.headless=true'])
    
    # load java classes
    FileInputStream    = Rjb::import('java.io.FileInputStream')
    TokenizerModel = Rjb::import('opennlp.tools.tokenize.TokenizerModel')
    TokenizerME = Rjb::import('opennlp.tools.tokenize.TokenizerME')
    
    attr_accessor :input, :lang, :model, :model_name, :tokens
    
    def initialize(input, lang = nil)
      @input = input
      @lang = lang || get_language
      @model_name = "#{@lang}-token.bin"
      get_model
    end
    
    def tokenize
      @tokens = @tokenizer.tokenize(@input)
    end
    
    def has_model?
      @model
    end
    
    private
    
    def get_model
      model_file = "#{MODELS}/token/#{@model_name}"
      if File.exists?(model_file)
        @model = TokenizerModel.new(FileInputStream.new(model_file))
        @tokenizer = TokenizerME.new(@model)
      else
        @model = false
      end
    end
    
  end
end