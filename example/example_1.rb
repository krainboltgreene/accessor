require 'accessor'

class Person
  accessor :name, :email
  writer :password
  reader :encrypted_password

  def encrypt_password!
    @encrypted_password = Base64::strict_encode64(@password)
  end

end

contact = Person.new
contact.name "Kurtis Rainbolt-Greene"
contact.email "me+accessor@kurtisrainboltgreene.name"
contact.email

contact.accessor!(:age).age 24
p contact