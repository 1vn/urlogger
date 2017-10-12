module Urlogger
  class Visit < ApplicationRecord
    validates :url, presence: true
  end
end
