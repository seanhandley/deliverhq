require_relative '../test_helper'
require_relative '../integration_test_helper'

module Deliverhq
  class SendTest < Minitest::Test
    
    def setup
      @params = {from: 'foo@datacentred.co.uk',
        to: 'test@test.com', subject: 'Foo',
        plain_body: 'Bar'}
    end
    
    def test_send_email
      VCR.use_cassette('send_email') do
        message = Deliverhq.send(@params)
        assert message.body.include?(@params[:plain_body])
      end
    end
  
  end
end
