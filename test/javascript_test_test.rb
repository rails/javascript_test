require 'test/unit'
require 'lib/javascript_test.rb'

# mock RAILS_ROOT required because of file existance check
RAILS_ROOT = File.dirname(File.expand_path(__FILE__));

class JavascriptTestTest < Test::Unit::TestCase
  
  def test_javascript_test_runner
    runner = JavaScriptTest::Runner.new do |t| 
      t.mount("/test", RAILS_ROOT+'/test')
      t.mount('/test/javascript/assets', RAILS_ROOT+'/../assets')
      t.run('test')
      
      t.browser(:firefox)
    end
    
    assert runner.successful?
  end
  
end