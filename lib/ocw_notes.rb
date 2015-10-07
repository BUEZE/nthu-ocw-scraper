module OcwNotes
  # This class get a user-specified course name as input
  # return a hash of course's notes provided by other students
  # Url of the source website: http://ocw.nthu.edu.tw/ocw/index.php?page=mediaList&classid=5
  class OpenCourseWareNotes

    # Initialize instance when created
    def initialize(coursename)
    end

    # Return notes in hash
    def notes
        @notes ||= extract_notes
    end

    private

    # Parse html from url with given course name
    def parse_html(coursename)
    end

    # Extrace notes from parsed html file
    def extract_notes
    end

  end
end
