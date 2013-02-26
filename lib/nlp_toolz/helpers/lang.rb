module Lang
  include UrlHandler
  # get language of input
  def get_language(text = nil)
    uri = build_url("arielle.tm.informatik.uni-leipzig.de", 55700, "/langid", nil)
    if @input
      asv_response = post_data(URI.escape(@input),uri,{'Content-type'=>'text/plain;charset=utf-8'})
    elsif text
      asv_response = post_data(URI.escape(text),uri,{'Content-type'=>'text/plain;charset=utf-8'})
    end
    response = MultiJson.load(asv_response.body)

    response["lang"]
  end
  
  # ToDo 2013-02-26: make different lang identifier available
  def alternative_langs lang
    langs = {
      en: [:eng, :english],
      de: [:ger, :german]
    }.each.collect{|x| x.flatten}
  end
end
