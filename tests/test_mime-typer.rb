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
class MimeTyper < MyTest
  def test_recognition
    puts 'Checking detection by path . . . '
    result = MIME::Typer.detect('./dog.jpg')
    assert_equal result, 'image/jpeg'
    puts 'Checking detection by file . . . '
    result = MIME::Typer.detect(File.open('./dog.jpg'))
    assert_equal result, 'image/jpeg'
    puts 'Detection tests complete'
  end
end
