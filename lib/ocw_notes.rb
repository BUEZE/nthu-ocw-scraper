# OcwNotes Module
module OcwNotes
  require 'rubygems'
  require 'nokogiri' # gem install nokogiri
  require 'net/http'

  def write_to_file(content, filename)
    File.open(filename, 'w') { |file| file.write(content) }
  end
end