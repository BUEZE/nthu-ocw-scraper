require 'minitest/autorun'
require 'minitest/rg'
require './lib/ocw_notes.rb'

notes = {
  '615' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=615',
    'course' => '心理學與現代生活',
    'title' => 'W5記憶',
    'author' => '中文17 陳懷瑜'
  },
  '614' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=614',
    'course' => '心理學與現代生活',
    'title' => 'W4意識',
    'author' => '詹雨臻'
  },
  '622' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=622',
    'course' => '心理學與現代生活',
    'title' => 'W14心理疾病的類型與診斷',
    'author' => '中文17 陳懷瑜'
  },
  '616' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=616',
    'course' => '心理學與現代生活',
    'title' => 'W6學習與制約',
    'author' => '中文17 陳懷瑜'
  },
  '612' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=612',
    'course' => '心理學與現代生活',
    'title' => 'W2心理學的生物基礎',
    'author' => '詹雨臻'
  },
  '621' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=621',
    'course' => '心理學與現代生活',
    'title' => 'W13人格',
    'author' => '中文17 陳懷瑜'
  },
  '620' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=620',
    'course' => '心理學與現代生活',
    'title' => 'W9社會影響與社會認知',
    'author' => '中文17 陳懷瑜'
  },
  '619' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=619',
    'course' => '心理學與現代生活',
    'title' => 'W10 思考與創造力',
    'author' => '中文17 陳懷瑜'
  },
  '613' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=613',
    'course' => '心理學與現代生活',
    'title' => 'W3知覺與注意力',
    'author' => '詹雨臻'
  },
  '617' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=617',
    'course' => '心理學與現代生活',
    'title' => 'W8心理發展',
    'author' => '中文17 陳懷瑜'
  },
  '618' => {
    'url' => 'http://ocw.nthu.edu.tw/ocw/index.php?page=mediaContent&id=618',
    'course' => '心理學與現代生活',
    'title' => 'W11情緒',
    'author' => '中文17 陳懷瑜'
  }
}

describe 'Get all the notes with specific keywords' do
  before do
    @notes_found = OcwNotes::OpenCourseWareNotes.get_notes('心理學')
  end

  it 'has the right number of notes' do
    @notes_found.size.must_equal notes.size
  end
end
