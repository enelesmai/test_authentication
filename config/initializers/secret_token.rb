# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

#TestAuthentication::Application.config.secret_token = 'bd3c9b4e58613051ed24d73609072b2983c3109f114e50a64554f4b9dc6ac990e4adf4d07856bc3e2b062b0ff50cb573834c945515baf50dabaf3ad9d70d3de2'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

TestAuthentication::Application.config.secret_token = secure_token