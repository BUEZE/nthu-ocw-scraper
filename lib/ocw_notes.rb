module OcwNotes
  # This class get a user-specified course name as input
  # return a hash of course's notes provided by other students
  # Url of the source website: http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5
  class OpenCourseWareNotes

    def initialize(coursename)
    end

    def notes
        @notes ||= extract_notes
    end

    private

    def parse_html(coursename)
    end

    def extract_notes
    end

  end
end
