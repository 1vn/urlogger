require 'urlogger/engine'

module Urlogger
  mattr_accessor :regex_match
  # Counter which handles saving ActiveRecord based on regex matching the url
  class VisitCounter
    def initialize
      @regex_match = Urlogger.regex_match
    end

    def log_url(url)
      @visit = Visit.new
      if @regex_match.respond_to?('match') && @regex_match.match(url)
        @visit.url = @regex_match.inspect
      else
        @visit.url = url
      end
      @visit.save
    end
  end
end
