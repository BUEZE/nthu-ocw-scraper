require_relative 'ocw_notes'

# This class get a user-specified course name as input
# return a hash of course's notes provided by other students
# Url of the source website: http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5
class OpenCourseWareNotes
  include OcwNotes

  $home_string = 'http://ocw.nthu.edu.tw/ocw/'

  # Parse html from url with given course name
  def parse_html(coursename)
    search_link_str = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5&keyword='
    docs = get_url_html(search_link_str + coursename) # get url's html source code
    search_arr = docs.xpath("//div[@class='singleMediaBlock']") # get all link class by 'singleMediaBlock'
    # print search_link_str + coursename
    links = [] # get all search result link
    search_arr.each do |x|
      links.push x.attributes['onclick'].content.match(/'([^']+)/)[1] # parse onclick string
    end
    # print links
    get_note_img_link(links[0])
    # p links
  end

  private

  def get_note_img_link(url)
    target_link = $home_string + url
    # target_link = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=615'

    docs = get_url_html(target_link) # get url's html source code
    # write_to_file(docs, './test.html')
    img_arr = docs.xpath("//div[@class='mediaBlock']/ul/li/img")
    img_arr.each do |x|
      x = $home_string + x.attributes['src'].content
    end
    img_arr
  end

  # Extrace notes from parsed html file
  def extract_notes
  end

  private

  # get link's html code and parse by Nokogiri
  def get_url_html(urlpath)
    url = URI.parse(str_to_ascii(urlpath))
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    html_doc = Nokogiri::HTML(res.body)
    html_doc
  end
end
