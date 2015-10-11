# OcwNotes Module
module OcwNotes
  require 'rubygems'
  require 'nokogiri' # gem install nokogiri
  require 'net/http'

  # get link's html code and parse by Nokogiri
  def get_url_html(urlpath)
    url = URI.parse(URI.encode(urlpath))
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    html_doc = Nokogiri::HTML(res.body)
    html_doc
  end

  def write_to_file(content, filename)
    File.open(filename, 'w') { |file| file.write(content) }
  end
end
