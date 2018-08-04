class StocksController < ApplicationController
	#ssl_required :check_payment
	def search
		if params[:stock].blank?
			flash.now.alert = "You have entered an empty search string"
		else
			@stock = Stock.new_form_lookup(params[:stock])
			flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
		end
		respond_to do |format|
				#flash.now.notice = "Good luck now!"
			format.js { render partial: 'users/result' }
		end
	end
end
