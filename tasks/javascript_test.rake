desc "Run tests for JavaScripts"
task 'test:javascripts' => :environment do
  JavaScriptTestrunner.new do |t| 
    
    t.mount('/assets', RAILS_ROOT+'/vendor/plugins/javascript_test/assets')
    t.mount("/test", RAILS_ROOT+'/test')
    t.mount("/javascripts", RAILS_ROOT+'/public/javascripts')
    
    Dir.glob('test/javascript/*_test.html').each do |js|
      t.run(File.basename(js,'.html').gsub(/_test/,''))
    end
    
    t.browser(:safari)
    t.browser(:firefox)
    t.browser(:ie)
    t.browser(:konqueror)
  end
end
