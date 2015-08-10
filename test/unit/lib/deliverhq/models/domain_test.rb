module Deliverhq
  
  require_relative '../../../../test_helper'
  
  class DomainTest < Minitest::Test
    def setup
      @domain_params = {name: "test.com"}
      @domain_response = {
            'account_id' => 1,
            'name' => 'test.com',
            'id' => 1234,
            'verification_token' => "54321",
            'verified_at' => nil
          }
      @domain = Domain.new(@domain_response)
    end
    
    def test_create
      Request::Domain.stub(:create, @domain_response) do
        assert_equal Domain.create(@domain_params).id, @domain.id
      end
    end

    def test_all
      Request::Domain.stub(:list, [@domain_response]) do
        assert_equal Domain.all.first.id, @domain.id
      end
    end

    def test_destroy
      Request::Domain.stub(:destroy, true) do
        assert @domain.destroy
      end
    end
  end
end