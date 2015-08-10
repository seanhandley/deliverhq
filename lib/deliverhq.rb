require 'faraday'
require 'json'
require 'date'

module Deliverhq
  require_relative 'deliverhq/models/domain'
  require_relative 'deliverhq/models/mailbox'
  require_relative 'deliverhq/models/message'
  require_relative 'deliverhq/request/base'
  require_relative 'deliverhq/request/domain/create'
  require_relative 'deliverhq/request/domain/delete'
  require_relative 'deliverhq/request/domain/list'
  require_relative 'deliverhq/request/mailbox/create'
  require_relative 'deliverhq/request/mailbox/delete'
  require_relative 'deliverhq/request/mailbox/list'
  require_relative 'deliverhq/request/message/list'
  require_relative 'deliverhq/request/message/show'
  require_relative 'deliverhq/response'

  class RequestError < StandardError; end

  def self.send(params)
    response = Request::Base.post('send', params.to_json)
    {'status': 'success', 'message_id': response.split(':').last.to_i}
  end
end
