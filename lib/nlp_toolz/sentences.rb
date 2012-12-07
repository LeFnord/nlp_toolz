# coding: utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-10-23

# ToDo 2012-10-24: add train capabilities
module NlpToolz
  class Sentences
    include Lang
    
    Rjb::load("jars/opennlp-tools-1.5.2.jar:jars/opennlp-maxent-3.0.2.jar",['-Xmx1024m','-Djava.awt.headless=true'])
    
    # load java classes
    FileInputStream    = Rjb::import('java.io.FileInputStream')
    SentenceDetectorME = Rjb::import('opennlp.tools.sentdetect.SentenceDetectorME')
    SentenceModel      = Rjb::import('opennlp.tools.sentdetect.SentenceModel')
    
    attr_accessor :input, :lang, :model_name, :sentences
    
    def initialize(input,lang = nil)
      @input = input
      @lang = lang || get_language
      @model_name = "#{@lang}-sent.bin"
      get_model
    end
    
    def split_into_sentences
      @sentences = @sentence_detector.sentDetect(@input).to_a
    end
    
    private
    
    def get_model
      model_file = "#{MODELS}/sent/#{@model_name}"
      if File.exists?(model_file)
        @model = SentenceModel.new(FileInputStream.new(model_file))
        @sentence_detector = SentenceDetectorME.new(@model)
      else
        raise 'file not found'
      end
    end
    
  end # class Sentences
end # module NlpToolz
