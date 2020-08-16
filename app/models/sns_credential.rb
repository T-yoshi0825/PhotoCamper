class SnsCredential < ApplicationRecord

	belongs _to :user, optional: true
	
end
