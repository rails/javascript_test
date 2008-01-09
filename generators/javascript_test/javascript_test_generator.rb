class JavascriptTestGenerator < Rails::Generator::NamedBase  
  default_options :app_assets => false

  def manifest
    record do |m|
      m.directory File.join("test","javascript")      
      m.template 'javascript_test.html', File.join('test/javascript', "#{name}_test.html")
    end
  end
  
  protected
  def banner
    "Usage: #{$0} javascript_test libary_file [--use-app-assets]"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("-A", "--use-app-assets",
           "Uses application's own version of prototype.js instead of the plugins") { |v| options[:app_assets] = v }
  end
end