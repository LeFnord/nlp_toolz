# coding: utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-10-24

# ToDo 2012-10-24: add train capabilities
module NlpToolz
  class PosTags
    include Lang
    
    Rjb::load("jars/opennlp-tools-1.5.2.jar:jars/opennlp-maxent-3.0.2.jar",['-Xmx1024m','-Djava.awt.headless=true'])
    
    # load java classes
    FileInputStream    = Rjb::import('java.io.FileInputStream')
    POSModel = Rjb::import('opennlp.tools.postag.POSModel')
    POSTaggerME = Rjb::import('opennlp.tools.postag.POSTaggerME')
    
    attr_accessor :input, :lang, :model, :model_name, :tagged_tokens
    
    def initialize(input, lang = nil)
      @input = input
      @lang = lang || get_language
      @model_name = "#{@lang}-pos-maxent.bin"
      get_model
    end
    
    def get_pos_tags
      @tokens = @input.tokenize
      @tagged_tokens = tokenize_it @tagger.tag(@tokens)
    end
    
    def has_model?
      @model
    end
    
    private
    
    def get_model
      model_file = "#{MODELS}/pos/#{@model_name}"
      if File.exists?(model_file)
        @model = POSModel.new(FileInputStream.new(model_file))
        @tagger = POSTaggerME.new(@model)
      else
        @model = false
      end
    end
    
    # ToDo 2012-11-28: only a workaround upto the opennlp tokenizer is implemented
    def tokenize_it stream
      foo = {token: [], tag: []}
      stream.split.each do |token|
        splitter = token.split("/")
        if splitter.length == 2
          foo[:token] << splitter.first
          foo[:tag] << splitter.last
        else
          splitter[0..-2].each do |splits|
            foo[:token] << splits
            foo[:tag] << splitter.last
          end
        end
      end
      foo
    end
    
  end # class PosTags
end # module NlpToolz
