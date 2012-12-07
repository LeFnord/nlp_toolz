module Lang
  include UrlHandler
  # get language of input
  def get_language
    uri = build_url("arielle.tm.informatik.uni-leipzig.de", 55700, "/langid", nil)
    asv_response = post_data(URI.escape(@input),uri,{'Content-type'=>'text/plain;charset=utf-8'})
    response = MultiJson.load(asv_response.body)
      
    response["lang"]
  end
end