class AjaxController < ApplicationController
	def upanel
		@time = Time.now.to_s
	end
	
	def search
		@books = Book.select('distinct publish')
	end
	
	def result
		sleep 2
		@books = Book.where(:publish => params[:publish])
	end
	
	def yahoo
		response_body = "<resultset><result><title>book001</title></result><result><title>book002</title></result></resultset>"
		@body = Hash.from_xml(response_body)
		#render :json=> Hash.from_xml(response_body).to_json
	end
end
