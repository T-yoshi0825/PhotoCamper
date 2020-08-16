class InquiryMailer < ApplicationMailer

	def inquiry_mail(inquiry)
		@inquiry = inquiry
		mail to: 'photocamper@example.com', subject: 'お問い合わせ内容'
	end
	
end
