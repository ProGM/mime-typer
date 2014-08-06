require 'net/http'
require 'tempfile'

class Net::HTTPResponse
  attr_reader :socket
end

module MIME
  # Public: A simple class to detect mime type of a file, using libmagic
  # You can detect both local and remote file types
  #
  # Examples
  #
  #   MIME::Typer.detect('/my/awesome/image/path.jpg')
  #   # => 'image/jpeg'
  class Typer
    # Public: Detects the MIME type of a file, given a path or a file
    #
    # file  - The String path or the File to be detected
    #
    # Examples
    #
    #   detect('/my/awesome/image/path.jpg')
    #   # => 'image/jpeg'
    #
    # Returns a String containing the MIME Type.
    def self.detect(file)
      path = file.is_a?(File) ? file.path : file
      `file --mime-type #{path} | awk '{ print $(NF) }'`.strip
    end

    # Public: Detects the MIME type of a remote file, given an url
    #
    # uri  - The String uri of the file
    #
    # Examples
    #
    #   remote('http://my.awesome.site.com/my_image.jpg')
    #   # => 'image/jpeg'
    #
    # Returns a String containing the MIME Type.
    def self.remote(uri)
      temp = Tempfile.new('mime-typer')
      temp.binmode
      temp.write(load_remote(uri))
      temp.close
      detect temp.path
    end

    # Internal: Loads the first 200 bytes of a file
    #
    # uri   - The String uri of the file
    # bytes - The Number of bytes to be loaded (default: 200)
    #
    # Examples
    #
    #   remote('http://my.awesome.site.com/my_pdf.jpg')
    #   # => 'PDF 1.4 etc...'
    #
    # Returns a binary String containing the first 200 bytes of the file.
    def self.load_remote(uri, bytes = 200)
      result = ''
      uri = URI(uri)
      ssl = uri.scheme == 'https'
      Net::HTTP.start(uri.host, uri.port, use_ssl: ssl) do |http|
        request = Net::HTTP::Get.new(uri.request_uri)
        http.request(request) do |response|
          result = response.socket.read(bytes)
          http.finish
        end
      end rescue nil
      result
    end
    private_class_method :load_remote
  end
end
