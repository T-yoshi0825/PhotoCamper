class InquiriesController < ApplicationController

	def new
		@inquiry = Inquiry.new
	end

	def confirm
		@inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
		if @inquiry.valid?
			render :action => 'confirm'
		else
			render :action => 'index'
		end
	end

	def thanks
		@inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
		InquiryMailer.inquiry_mail(@inquiry).deliver
		render :action => 'thanks'
	end

	private
	def inquiry_params
		params.require(:inquiry). permit(:name, :email, :message)
	end

end
