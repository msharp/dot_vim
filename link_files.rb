#!/usr/bin/ruby

rc_files = %w{vimrc gvimrc mvimrc}
begin
  rc_files.each do |file|
    dot_file = File.expand_path("~/.#{file}")
    if File.exists? dot_file
      puts "#{dot_file} already exists, skipping link."
    else
      File.symlink(".vim/#{file}", dot_file)
      puts "Created link for #{file} in your home folder."
    end
  end
rescue NotImplementedError
  puts "File.symlink not supported, you must do it manually."
  if RUBY_PLATFORM.downcase =~ /(mingw|win)(32|64)/
    puts 'Windows 7 use mklink, e.g.'
    puts '  mklink _vimrc .vim\vimrc'
  end
end
