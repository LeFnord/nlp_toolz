class String
  def tokenize
    foo = self.encode('UTF-8', :invalid => :replace, :undef => :replace)
    foo.gsub!("\"\'",'')
    foo.gsub!(/\b\/\b/,' ')
    foo.gsub!(/([\w]{3,90})([\(\)\.,;:!?])/,'\1 \2')
    foo.gsub!(/([\(\)\.,;:!?])([\w]{3,90})/,'\1 \2')
    foo
    # self.gsub!(/([\w]{3,90})([\(\)\.,;:!?])/,'\1 \2').gsub!(/([\(\)\.,;:!?])([\w]{3,90})/,'\1 \2').gsub!(/\b\/\b/,' ').split
  end
end
