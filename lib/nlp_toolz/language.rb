# coding:  utf-8
# author LeFnord
# email  pscholz.le@gmail.com
# date   2014-10-12

module NlpToolz
  
  class Language
    
    if Dir.exist?(File.join(NlpToolz::HOME,'models')) && Dir.exist?(File.join(NlpToolz::HOME,'jars'))
      # load java classes
      HashSet     = Rjb::import("java.util.HashSet")
    
      DataSourceException = Rjb::import("de.uni_leipzig.asv.toolbox.jLanI.kernel.DataSourceException")
      LanIKernel = Rjb::import("de.uni_leipzig.asv.toolbox.jLanI.kernel.LanIKernel")
      Request = Rjb::import("de.uni_leipzig.asv.toolbox.jLanI.kernel.Request")
      RequestException = Rjb::import("de.uni_leipzig.asv.toolbox.jLanI.kernel.RequestException")
      Response = Rjb::import("de.uni_leipzig.asv.toolbox.jLanI.kernel.Response")
    end
    
    def self.get_language(text = nil)
      return -1 if text.nil? || text.empty?
      lang_probability = identify text
      lang_probability.first
    end
    
    # set language and probability of sentence
    def self.identify(text)
      languages = HashSet.new
      modus = 0
      reduce = true
      
      req = Request.new(text, languages, modus, reduce)
      
      LanIKernel.propertyFile = File.join(MODELS,'language','lanikernel')
      kernel = LanIKernel.getInstance()
      res = kernel.evaluate(req)
      
      @lang,@probability = get_most_probability_lang(res.getResult.toString)
    end
    
    private
    def self.get_most_probability_lang(result)
      res = []
      foo = result.sub!("{","").sub!("}","").split(', ').collect{ |x| x.split('=') }
      foo.each{ |x| res << [x.first,x.last.to_f] }
      res.max{|a,b| a.last <=> b.last}
    end
  end

end
