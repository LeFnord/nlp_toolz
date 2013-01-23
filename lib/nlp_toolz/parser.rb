# coding:  utf-8
# @author: LeFnord
# @email:  pscholz.le@gmail.com
# @date:   2012-12-10

module NlpToolz
  class Parser
    include Lang
    include TmpFile
    # load java classes
    FileInputStream    = Rjb::import('java.io.FileInputStream')
    
    attr_reader :parsed
    attr_accessor :input, :lang, :model, :model_name, :parse_hash
    
    def initialize(input, lang = nil)
      @input = input
      @lang = lang || get_language
      @model_name = "#{@lang}-sm5.gr"
      get_model
    end
    
    def parse_text
      parsed = nil
      if self.has_model?
        jar = "#{JARS}/BerkeleyParser-1.7.jar"
        in_file = make_tmp_file_from @input.clean_up
        out_file = make_tmp_file_from
        `java -Xmx4g -jar #{jar} -gr #{@model} -inputFile #{in_file.path} -outputFile #{out_file.path} -tokenize -maxLength 500`.chomp
        @parsed = File.open(out_file).gets(nil).chomp

        parse_output_to_hash

        delete_and_unlink_tmp_file in_file
        delete_and_unlink_tmp_file out_file
      end
    end
    
    def has_model?
      @model
    end
    
    def layer(level = nil)
      @first_layer
    end

    def hash
      @parse_hash
    end
    
    private
    
    # helper for ...
    # initialize
    def get_model
      model_file = "#{MODELS}/parser/#{@model_name}"
      if File.exists?(model_file)
        @model = model_file
      else
        @model = false
      end
    end
    
    # convert: #tree -> #hash
    def parse_output_to_hash
      parsed = split_parse_tree(self.parsed)
      nodes = create_leafs(parsed)
      @parse_hash = make_hash_hash(nodes)
      
      @parse_hash
    end
    
    # helper for parsing to hash
    ::Leaf = Struct.new(:tag, :token)
    ::Node = Struct.new(:tag, :parent, :childs)

    # 1. split
    def split_parse_tree(parsed)
      bar = parsed.gsub("))", ") )").gsub("))", ") )")
                  .gsub("(", "{")
                  .gsub(")", "}")

      bar.split
    end

    # 2. merge tags and tokens, create leafs
    def create_leafs(parsed)
      @first_layer = {tags: [],tokens: []}
      leafs = {}
      foo = []
      parsed.each_with_index do |part,i|
        if part =~ /\{([\w\-]+|\$\p{P}|\p{P})/ && parsed[i+1] =~ /([\p{L}\p{N}\-\.]+|\p{P})\}/
          tag = part.gsub("{","")
          token = parsed[i+1].gsub("}","")
          @first_layer[:tags] << tag
          @first_layer[:tokens] << token

          leaf = Leaf.new(tag.to_sym,token)

          if foo[foo.length-1].is_a?(Hash)
            foo[foo.length-1] = [foo[foo.length-1], leaf]
          elsif foo[foo.length-1].is_a?(Array)
            foo[foo.length-1] << leaf
          else
            foo << leaf
          end
        elsif part !~ /([\p{L}\p{N}\-]+|\p{P})\}/
          if part =~ /(\{)(.+)/
            foo << "{#{part.gsub("{","")}"
          else
            foo << "#{part}"
          end
        end
      end

      foo
    end

    def make_hash_hash(nodes)
      tmp = catch(:done) {
        nodes.reverse.each_with_index do |node,i|
          if node =~ /\{(\w+)/
            key = node.match(/\{(\w+)/)[1].to_sym
            part = []
            nodes[-i-1..-1].each_with_index do |x,ii|
              if x == "}"
                part = {key => nodes[-i..-i+ii-2]}
                throw :done, [nodes[0..-i-2],part,nodes[-i+ii..-1]].flatten
              end
            end
          end
        end
      }
      if tmp.length > 3
        make_hash_hash(tmp)
      else
        tmp[1]
      end
    end
  end # class Parser
end # module NlpToolz