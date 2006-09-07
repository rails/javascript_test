desc "Run tests for JavaScripts"
task 'test:javascripts' => :environment do
  JavaScriptTestrunner.new do |t| 
    
    t.mount('/assets', RAILS_ROOT+'/vendor/plugins/javascript_test/assets')
    t.mount("/test")
    
    t.run("application")
    
    t.browser(:safari)
    t.browser(:firefox)
    t.browser(:ie)
    t.browser(:konqueror)
  end
end

desc "Setup the necessary files and folders for JavaScript testing"
task 'test:javascripts:install' => :environment do
  puts "Unfinished"
end
