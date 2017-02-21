class ApplicationController < ActionController::Base
  # ここである必要はないけど。。。
  ALPHANUMERIC = '1'
  NUMERIC = '2'
  ALPHABET = '3'

  NOTSYMBOLANDUPPER = '1'
  SYMBOLANDUPPER = '2'
  SYMBOLONLY = '3'
  UPPERONLY = '4'
  protect_from_forgery with: :exception
end
