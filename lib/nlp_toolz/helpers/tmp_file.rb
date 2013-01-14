module TmpFile
  module_function
  
  def make_tmp_file_from text = nil
    tmp_file = ::Tempfile.new('tmp.txt')
    tmp_file.write text unless text.nil?
    tmp_file.rewind
    tmp_file
  end
  
  def delete_and_unlink_tmp_file tmp_file
    tmp_file.close
    tmp_file.unlink
  end
  
end