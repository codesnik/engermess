# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_engermess_session',
  :secret => 'e1ffac1949a8133ce687116197ceaf11af07221db295f75897e2af935ccbec96b0c2ac553eb2231746e36349d563e3d818995424cca7bd18319794c312bbd14e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
