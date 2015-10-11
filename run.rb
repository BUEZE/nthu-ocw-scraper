require_relative 'lib/ocw_notes'
# require 'OcwNotes'

course = OpenCourseWareNotes.new
print course.get_notes('心理學')