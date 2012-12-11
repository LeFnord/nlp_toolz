# coding:  utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-12-10

module NlpToolz
  class Parser
    include Lang
    
    # load java classes
    FileInputStream    = Rjb::import('java.io.FileInputStream')
    
    attr_accessor :input, :lang, :model, :model_name, :parse_tree
    
    def initialize(input, lang = nil)
      @input = input
      @lang = lang || get_language
      @model_name = "#{@lang}-sm5.gr"
      get_model
    end
    
    def parse_text
      if self.has_model?
        jar = "#{JARS}/BerkeleyParser-1.7.jar"
        ap "java -jar #{jar} -gr #{@model}"
        cmd = system("java -jar #{jar} -gr #{@model} -tokenize=true")
        ap cmd
      end
    end
    
    def has_model?
      @model
    end
    
    private
    
    def get_model
      model_file = "#{MODELS}/parser/#{@model_name}"
      if File.exists?(model_file)
        @model = model_file
      else
        @model = false
      end
    end
    
  end
  
  
end