class Doctor < ApplicationRecord

  def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |doctor|
			doctor.provider = auth.provider
			doctor.uid = auth.uid
			doctor.first_name = auth.info.first_name
			doctor.last_name = auth.info.last_name
			doctor.email = auth.info.email
			doctor.picture = auth.info.image
			doctor.save!
		end
	end

end
