class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  
  if Rails.env.production?
    rescue_from Exception,                           with: :rescue500
    rescue_from ActionController::ParameterMissing,  with: :rescue400
    rescue_from Forbidden,                           with: :rescue403
    rescue_from IpAddressRejected,                   with: :rescue403
    rescue_from ActionController::RoutingError,      with: :rescue404
    rescue_from ActiveRecord::RecordNotFound,        with: :rescue404
  end
  # include ErrorHandlers # if Rails.env.production?

  private
    def rescue400(e)
      @exception = e
      render 'errors/bad_request', status: 400
    end

    def rescue403(e)
      @exception = e
      render 'errors/forbidden', status: 403
    end

    def rescue404(e)
      @exception = e
      render 'errors/not_found', status: 404
    end

    def rescue500(e)
      @exception = e
      render 'errors/internal_server_error', status: 500
    end

    def set_layout
      if params[:controller].match(%r{\A(staff|admin|customer)/})
        Regexp.last_match[1]
      else
        'customer'
      end
    end
end
