# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_madfiber_session',
  :secret => 'd5e22ceab94edbc0f639cf504fb0968da33bcc9a9b5f992c473234ae4e6fd759396c3b981a8865a11a8430470e7e810b977d8800d7f270d1544a4a712e4cdd83'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
