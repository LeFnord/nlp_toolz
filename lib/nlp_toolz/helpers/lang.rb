module Lang

  include UrlHandler
  # get language of input
  def get_language(text = nil)
    environment = ENV['ENV_NAME'] || 'development'
    # ToDo 2013-03-14: respect environment
    case environment
    when 'development'
      # development -> local
      # uri = build_url("localhost", 9292, "/langid", nil)
      uri = build_url("arielle.tm.informatik.uni-leipzig.de", 55700, "/langid", nil)
    when 'production'
      # production
      uri = build_url("arielle.tm.informatik.uni-leipzig.de", 55700, "/langid", nil)
    end

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
