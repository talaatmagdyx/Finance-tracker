class StocksController < ApplicationController
	#ssl_required :check_payment
	def search
		if params[:stock].blank?
			flash.now.alert = "You have entered an empty search string"
		else
			@stock = Stock.new_form_lookup(params[:stock])
			#@newstock = @stock
			if @stack 
				respond_to do |format|
			      format.js { render partial: 'users/result' }
				end	

			else
				respond_to do |format|
					flash.now[:danger] = "You have entered an incorrect symbol"
				    format.js { render partial: 'users/result' }
				end
			end

		else
			respond_to do |format|
				#flash.now.notice = "Good luck now!"
				format.js { render partial: 'users/result' }
			end
		end
	end
end
