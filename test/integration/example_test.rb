require_relative '../test_helper'
require_relative '../integration_test_helper'

module Deliverhq
  class DomainsTest < Minitest::Test
    
    def setup
      @domain_name = "foobar.com"
    end
    
    def test_create_list_and_delete_domains
      VCR.use_cassette('crd_domains') do
        domain_count = Domain.all.count
        domain = Domain.create(name: @domain_name)
        assert_equal domain.name, @domain_name
        assert_equal domain_count+1, Domain.all.count
        assert domain.destroy
        assert_equal domain_count, Domain.all.count
      end
    end
  
  end
end
