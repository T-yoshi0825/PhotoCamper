class InquiriesController < ApplicationController

	def new
		@inquiry = Inquiry.new
		@categories = Category.where(active_status: :true)
	end

	def confirm
		@inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
		@categories = Category.where(active_status: :true)
		if @inquiry.valid?
			render :action => 'confirm'
		else
			render :action => 'index'
		end
	end

	def thanks
		@inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
		@categories = Category.where(active_status: :true)
		InquiryMailer.inquiry_mail(@inquiry).deliver
		render :action => 'thanks'
	end

	private
	def inquiry_params
		params.require(:inquiry). permit(:name, :email, :message)
	end

end
