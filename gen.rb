appName = ARGV.first
Dir.mkdir(appName) unless File.exists?(appName)
Dir.mkdir("#{appName}/public")
Dir.mkdir("#{appName}/public/images")
Dir.mkdir("#{appName}/public/scripts")
Dir.mkdir("#{appName}/public/fonts")
Dir.mkdir("#{appName}/views")
File.open("#{appName}/server.rb", "w+") {|f| f.write("require 'sinatra'\n\nget '/' do\n\s\serb :index\nend") }
File.open("#{appName}/Gemfile", "w+") {|f| f.write("source 'https://rubygems.org'\n\ngem 'sinatra'") }
File.open("#{appName}/Procfile", "w+") {|f| f.write("web: bundle exec ruby server.rb -p $PORT") }
File.open("#{appName}/views/layout.erb", "w+") {|f| f.write("<html>\n\s\s<head>\n\s\s\s\s<link href='layout.css' rel='stylesheet' type='text/css'>\n\s\s</head>\n\s\s<body>\n\s\s\s\s<%= yield %>\n\s\s</body>\n</html>") }
File.open("#{appName}/public/layout.css", "w+") {|f| f.write("/* ADD YOUR LAYOUT CSS HERE */") }
File.open("#{appName}/public/scripts/main.js", "w+") {|f| f.write("// ADD YOUR JAVASCRIPT HERE") }
