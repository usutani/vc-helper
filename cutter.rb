require 'optparse'

def usage
  puts "Usage: ruby cutter.rb [--dst DST_PREFIX] <file(s)>"; exit
end

def add_prefix_to_file(path, prefix)
  File.join(File.dirname(path), prefix + File.basename(path))
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
  dst_file = add_prefix_to_file(src_file, dst_prefix)
  s = File.read(src_file)
  
  # remove line comments
  if s.gsub!(/^[ \t]*\/\/.*\n/, "")
    f = File.new(dst_file, "w")
    f.write s
    print "."
  end
end

puts "Done"
