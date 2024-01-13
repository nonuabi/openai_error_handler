require "openai_error_handler/version"
require 'openai_error_handler/error_handler'
require 'openai_error_handler/middleware'
require 'openai_error_handler/api'

module OpenaiErrorHandler
  class << self
    attr_accessor :api_key
  end

  class Error < StandardError; end
end
