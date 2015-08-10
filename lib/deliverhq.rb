require 'faraday'
require 'json'
require 'date'

module Deliverhq
  require_relative 'deliverhq/models/domain'
  require_relative 'deliverhq/request/base'
  require_relative 'deliverhq/request/domain/create'
  require_relative 'deliverhq/request/domain/delete'
  require_relative 'deliverhq/request/domain/list'
  require_relative 'deliverhq/response'

  class RequestError < StandardError; end
end
