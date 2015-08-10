require 'simplecov'
if require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    add_filter '/test/'
  end
end

require_relative '../lib/deliverhq'

TEST_ENV = true

require 'rubygems'
gem "minitest"
require 'minitest/autorun'
