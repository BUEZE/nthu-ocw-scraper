# OcwNotes Module
module OcwNotes
  require 'rubygems'
  require 'nokogiri' # gem install nokogiri
  require 'net/http'

  # turn link from UTF-8 to ASCII (because of chinese character)
  def str_to_ascii(convert_string)
    # ascii_str = convert_string.unpack("U*").map{|c|c.chr}.join
    ascii_str = convert_string.unpack('U*').map { |c| c.chr rescue '_' }.join
    ascii_str
  end

  def write_to_file(content, filename)
    File.open(filename, 'w') { |file| file.write(content) }
  end
end