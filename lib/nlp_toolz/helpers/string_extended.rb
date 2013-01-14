# coding: utf-8

class String
  def clean_up
    foo = self.encode('UTF-8', :invalid => :replace, :undef => :replace)
    bar = foo.gsub(/[\p{Pi}\p{Pf}"'„“‘’“”«»‹›]/,'')       # quotation marks
             .gsub(/\b\/\b/,' ')
             .gsub(/(\p{Ps})(.)/,'\1 \2')   # left braces
             .gsub(/(.)(\p{Pe})/,'\1 \2')   # right braces
             .gsub(/([\w]{3,})([\.])/,'\1 \2')  # abbrevation?
             .gsub(/(.)([,;:!?]+)/,'\1 \2')     # punctation
    # bar = foo.gsub(/["'„“,‘‘’“”«»‹›]/,'')       # quotation marks
    #          .gsub(/\b\/\b/,' ')
    #          .gsub(/([\[\(\{<])(.)/,'\1 \2')   # left braces
    #          .gsub(/(.)([\]\)\}>])/,'\1 \2')   # right braces
    #          .gsub(/(.)([,;:!?]+)/,'\1 \2')     # punctation
    #          .gsub(/([\w]{3,})([\.])/,'\1 \2')  # abbrevation?
    bar
  end
  
  def basename
    self.split("/").last
  end
end

