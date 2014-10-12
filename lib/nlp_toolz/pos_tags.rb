# coding: utf-8
# author: LeFnord
# email:  pscholz.le@gmail.com
# date:   2012-10-24

# ToDo 2012-10-24: add train capabilities
module NlpToolz

  class PosTags
    
    # load java classes
    FileInputStream = Rjb::import('java.io.FileInputStream')
    POSModel        = Rjb::import('opennlp.tools.postag.POSModel')
    POSTaggerME     = Rjb::import('opennlp.tools.postag.POSTaggerME')
    
    attr_accessor :input, :lang, :model, :model_name, :tokenized
    
    def initialize(input, lang = nil)
      @input = input
      @lang = lang || NlpToolz::Language.get_language_2(input)
      @model_name = "#{@lang}-pos-maxent.bin"
      get_model
    end
    
    def get_pos_tags
      if self.has_model?
        @tokenized = tokenize_it @tagger.tag(@input.clean_up)
      end
    end
    
    def tokens
      @tokenized[:tokens]
    end
    
    def tags
      @tokenized[:tags]
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
      foo = {tokens: [], tags: []}
      stream.split.each do |token|
        splitter = token.split("/")
        if splitter.length == 2
          foo[:tokens] << splitter.first
          foo[:tags] << splitter.last
        else
          splitter[0..-2].each do |splits|
            foo[:tokens] << splits
            foo[:tags] << splitter.last
          end
        end
      end
      foo
    end
    
  end # class PosTags

end # module NlpToolz
