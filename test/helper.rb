require "minitest/pride"
require 'minitest/autorun'
require 'accessor'

class Person
  accessor :name, :email
  writer :password
  reader :encrypted_password

  def encrypt_password!
    @encrypted_password = Base64::strict_encode64(@password)
  end

end