require 'simplecov'
if require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter '/test/'
  end
end

require_relative '../lib/deliverhq'

TEST_ENV = true

ENV['DELIVERHQ_ID'] = 'foo'
ENV['DELIVERHQ_KEY'] = 'bar'

require 'rubygems'
gem "minitest"
require 'minitest/autorun'
