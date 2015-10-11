require_relative 'ocw_notes'

# This class get a user-specified course name as input
# return a hash of course's notes provided by other students
# Url of the source website: http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5
class OpenCourseWareNotes
  include OcwNotes

  attr_accessor :course
  attr_accessor :data
  $home_string = 'http://ocw.nthu.edu.tw/ocw/'

  # Parse html from url with given course name
  def parse_html(coursename)
    data = Hash.new {}
    search_link_str = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5&keyword='

    # get url's html source code
    docs = get_url_html(search_link_str + coursename)

    # get all link class by 'singleMediaBlock'
    search_arr = docs.xpath("//div[@class='singleMediaBlock']")
    links = [] # get all search result link
    search_arr.each do |x|
      # parse onclick string
      links.push x.attributes['onclick'].content.match(/'([^']+)/)[1]
    end
    links.each do |link|
      arr = link.split('=')
      id = arr[arr.length - 1]
      data[id] = extract_notes(link)
    end
    data
  end

  # Extrace notes from parsed html file
  def extract_notes(url)
    @course = Hash.new {}
    target_link = $home_string + url
    # target_link = 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=615'

    docs = get_url_html(target_link) # get url's html source code
    # write_to_file(docs, './test.html')
    img_arr = docs.xpath("//div[@class='mediaBlock']/ul/li/img")
    img_arr2 = []
    img_arr.each do |x|
      img_arr2.push($home_string + x.attributes['src'].content)
    end
    title_arr = docs.xpath("//div[@class='post_content_top-bgbtm']/div")
    title = title_arr[2].xpath('//div/div/h2')
    course_name = title_arr[2].xpath('//div/div/h3')
    course_name = course_name.first.content.split(' / ')
    course['title'] = title[0].content.gsub(/\s+/, '')
    course['course'] = course_name[0].gsub(/\s+/, '')
    course['author'] = course_name[1]
    course['url'] = target_link
    course['images'] = img_arr2
    course
  end
end
