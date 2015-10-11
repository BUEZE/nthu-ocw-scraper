require_relative 'lib/open_course_ware_notes'
# require 'OcwNotes'

course = OpenCourseWareNotes.new
print course.parse_html('心理學')