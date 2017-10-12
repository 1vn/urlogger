require 'urlogger/engine'

module Urlogger
  class VisitCounter
    def initialize(regex_match = '%s')
      @regex_match = regex_match
    end

    def log_url(url)
      @visit = Visit.new
      @visit.url = Regexp.new(@regex_match % Regexp.escape(url)).match(url)
      if @visit.url && @regex_match != '%s'
        @visit.url = @regex_match
      end
      @visit.save
    end
  end
end
