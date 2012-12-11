# coding:  utf-8

class String
  def tokenize
    foo = self.encode('UTF-8', :invalid => :replace, :undef => :replace)
    bar = foo.gsub(/["'„“,‘‘’“”«»‹›]/,'')       # quotation marks
             .gsub(/\b\/\b/,' ')
             .gsub(/([\[\(\{<])(\w)/,'\1 \2')   # left braces
             .gsub(/(\w)([\]\)\}>])/,'\1 \2')   # right braces
             .gsub(/([\w]{3,})([\.])/,'\1 \2')  # abbrevation?
             .gsub(/([\.])([\w]{3,})/,'\1 \2')
             .gsub(/(.)([,;:!?]+)/,'\1 \2')     # punctation
    bar
  end
  
  def basename
    self.split("/").last
  end
end

