class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  include ApplicationHelper

  def record_not_found
    render :not_found
  end
end
