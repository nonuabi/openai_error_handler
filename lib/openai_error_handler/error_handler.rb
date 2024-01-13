require 'json'
require 'net/http'
require 'uri'

module OpenaiErrorHandler
  class ErrorHandler
    def self.handle_error(expecption)
      # log the error
      Rails.logger.error("Caught exception! #{expecption.message}")
      Rails.logger.error(expecption.backtrace.join("\n"))
    end

    def self.send_error_to_openai(expecption)
      uri = URI.parse('https://api.openai.com/v1/engines/text-davinci-003/completions')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      prompt = generate_openai_prompt(expecption)

      request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
      request.body = { prompt: prompt, max_tokens: 100 }.to_json

      request['Authorization'] = "Bearer #{OpenaiErrorHandler.api_key}"

      response = http.request(request)

      handle_openai_response(response)
    end

    def self.generate_openai_prompt(expecption)
      "Error: #{exception.message}\nBacktrace: #{exception.backtrace.join("\n")}"
    end

    def self.handle_openai_response(response)
      case response
      when Net::HTTPSuccess
        solution = JSON.parse(response.body)['choices'][0]['text'].strip
        Rails.logger.info("OpenAI Solution: #{solution}")
      else
        # log the error
        Rails.logger.error("Failed to get a solution from OpenAI. HTTP Status: #{response.code}, Body: #{response.body}")
      end
    end
  end
end
