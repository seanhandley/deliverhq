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
        response = Deliverhq.send(@params)
        assert_equal 222498860, response[:message_id]
        message = Deliverhq::Message.find(222498860)
        assert message.body.include?(@params[:plain_body])
      end
    end
  
  end
end
