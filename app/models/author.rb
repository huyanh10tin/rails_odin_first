class Author < ApplicationRecord
	# has_secure_password
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
