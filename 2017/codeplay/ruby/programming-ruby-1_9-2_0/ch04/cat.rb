#!/usr/bin/env ruby

class File
  def self.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end

filename = ARGV[0]
if filename
  File.open_and_process(filename, "r") do |f|
    while line = f.gets
      puts line
    end
  end
end
