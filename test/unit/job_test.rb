require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "should create job" do
    job = Job.new
    
    job.title = "Test article"
    job.body = "Test body"
    
    assert job.save
  end
end
