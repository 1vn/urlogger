require_dependency 'urlogger/application_controller'

module Urlogger
  # Controller for page to view breakdown of url visits per day
  class VisitsController < ApplicationController
    http_basic_authenticate_with name: 'dhh', password: 'secret'
    before_action :set_visit, only: :show

    # GET /visits
    def index
      @visits = Visit.group('url').group('DATE(created_at)').count
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = 'attachment; filename=\"visits-list-%d\"' % (Time.now.to_i)
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end
  end
end
