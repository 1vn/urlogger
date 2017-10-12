require 'urlogger/engine'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :log_hook

  def initialize
    @logger = Urlogger::VisitCounter.new
  end

  private

  def log_hook
    @logger.log_url request.fullpath
  end
end
