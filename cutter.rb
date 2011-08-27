require 'optparse'

def usage
  puts "Usage: ruby cutter.rb [--dst DST_PREFIX] <file(s)>"; exit
end

Encoding.default_external = Encoding::CP932
dst_prefix = "_"

args = ARGV.dup
opts_parser = OptionParser.new do |opts|
  opts.on("--dst DST_PREFIX") { |opt| dst_prefix = opt }
end
args = opts_parser.parse!(args)

src_files = args.shift
usage unless src_files

Dir.glob(src_files) do |src_file|
  dst_file = dst_prefix + src_file
  s = File.read(src_file)
  
  # remove line comments
  if s.gsub!(/^[ \t]*\/\/.*\n/, "")
    f = File.new(dst_file, "w")
    f.write s
    print "."
  end
end

puts "Done"
