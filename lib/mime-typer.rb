module MIME
  class Typer
    def self.detect(file)
      path = file.is_a?(File) ? file.path : file
      `file --mime-type #{path} | awk '{ print $(NF) }'`.strip
    end
  end
end
