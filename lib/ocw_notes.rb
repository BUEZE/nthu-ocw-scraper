module OcwNotes
  # This class get a user-specified course name as input
  # return a hash of course's notes provided by other students
  # Url of the source website: http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5
  class OpenCourseWareNotes
    require 'rubygems'
    require 'nokogiri' # gem install nokogiri
    require 'net/http'
    # Return notes in hash
    # http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5&keyword=心理學

    $home_string = 'http://ocw.nthu.edu.tw/ocw/'

    def self.get_notes(coursename)
      search_link_str = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5&keyword='
      docs = self.get_url_html(search_link_str + coursename) # get url's html source code
      searchArr = docs.xpath("//div[@class='singleMediaBlock']") # get all link class by 'singleMediaBlock'

      links = [] # get all search result link
      searchArr.each do |x| 
        links.push x.attributes['onclick'].content.match(/'([^']+)/)[1] # parse onclick string
      end
      get_note_img_link(links[0])
      # p links
    end

    def self.get_note_img_link(url)
      target_link = $home_string+url
      # target_link = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=615'

      docs = self.get_url_html(target_link) # get url's html source code
      # write_to_file(docs, './test.html')
      imgArr = docs.xpath("//div[@class='mediaBlock']/ul/li/img")
      imgArr.each do |x| 
        x = $home_string + x.attributes['src'].content
      end
      imgArr
    end

    private

    # Parse html from url with given course name
    def parse_html(coursename)

    end

    # Extrace notes from parsed html file
    def extract_notes
    end

    # get link's html code and parse by Nokogiri
    def self.get_url_html(urlpath)
      url = URI.parse(self.strToASCII(urlpath))
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      html_doc = Nokogiri::HTML(res.body)
    end

    # turn link from UTF-8 to ASCII (because of chinese character)
    def self.strToASCII(convert_string)
      # ascii_str = convert_string.unpack("U*").map{|c|c.chr}.join
      ascii_str = convert_string.unpack("U*").map{|c|c.chr rescue '_' }.join 
    end

    def self.write_to_file(content,filename)
      File.open(filename, 'w') { |file| file.write(content) }
    end
  end
  OpenCourseWareNotes.get_notes('心理學');
end
