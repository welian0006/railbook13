class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :detect_locale
  before_filter :start_app_log
  after_filter :end_app_log
  
  rescue_from ActiveRecord::RecordNotFound, :with => :id_invalid
  
  def default_url_options(options={})
  	{:locale=> I18n.locale}
  end
  
  
  def app_log_test
  		sleep 3
		render :text=>'app_log_testアクションが実行されました'	
  end
  
  private
  
  def start_app_log
  	logger.debug('[Applications_12]'+Time.now.to_s)
  end
  
  def end_app_log
  	logger.debug('[Applicatione_12]'+Time.now.to_s)
  end
  
  def id_invalid
  	#render 'shared/record_not_found',:status => 403
  	#render :nothing => true, :status => :service_unavailable
  	#render :nothing=>true,:status=>:service_unavailable
  	#render status: :forbidden
	redirect_to '/403'
  end
  
  def detect_locale
  	#I18n.locale = request.headers['Accept-Language'].scan(/^[a-z]{2}/).first
  	I18n.locale = params[:locale]
	#I18n.locale = nil
	#logger.debug('super super super params is---->'+params[:locale])
  end
  
end
