require 'mime-typer'

if RUBY_VERSION < '2.0'
  require 'test/unit'
  class MyTest < Test::Unit::TestCase
  end
else
  require 'minitest/autorun'
  class MyTest < MiniTest::Test
  end
end

class MimeTyperTest < MyTest
  def test_recognition
    puts 'Checking detection by path . . . '
    result = MIME::Typer.detect('./test.png')
    assert_equal 'image/png', result
    puts 'Checking detection by file . . . '
    result = MIME::Typer.detect(File.open('./test.png'))
    assert_equal 'image/png', result
    puts 'Detection tests complete'
  end

  def test_uri_recognition
    puts 'Checking detection by uri . . . '
    result = MIME::Typer.remote('http://www.education.gov.yk.ca/pdf/pdf-test.pdf')
    assert_equal 'application/pdf', result
    puts 'Remote detection tests complete'
  end
end
