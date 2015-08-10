module Deliverhq
  require_relative '../../../test_helper'
  
  class ResponseTest < Minitest::Test
    def setup
      @response = OpenStruct.new(status: 0, body: nil, headers: {})
    end
    
    def test_does_not_raise
      @response.stub :body, {'domain' =>{'name' => 'foo.com'}}.to_json do
        @response.stub :status, 200 do
          Response.new(@response)  
        end
      end
    end
    
    def test_raises_error
      @response.stub :body, 'Server error' do
        @response.stub :status, 500 do
          assert_raises(StandardError, 'User not found') do
            Response.new(@response) 
          end
        end
      end
    end
  end
end
