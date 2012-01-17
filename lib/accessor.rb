require "accessor/version"

# The Accessor library is for giving your setters, getters, and accessors 
# a more suggary syntax:
#
# 
#     class Person
#       accessor :name, :email
#       writer :password
#       reader :encrypted_password
# 
#       def encrypt_password!
#         @encrypted_password = Base64::strict_encode64(@password)
#       end
#
#     end
#
#     contact = Person.new
#     contact.name "Kurtis Rainbolt-Greene"
#     contact.email "me+accessor@kurtisrainboltgreene.name"
#     contact.email
#       # => "me+accessor@kurtisrainboltgreene.name"
#     contact.password "ilovehorsesthateatglue"
#     contact.password
#       # => 0 for 1 arguments
#     contact.encrypted_password "Test!"
#       # => 1 for 0 arguments
#     contact.encrypt_password!
#     contact.encrypted_password
#       # => "MTIzNDEyMzQ="
#     contact.name("James Earl Jones").email("jejones@gmail.com")
#       # => #<Person:0x3E034 @name="James Earl Jones" @email="jejones@gmail.com">
#
module Accessor
  # Your code goes here...
  # The `reader` method is a metamethod, and it takes an `Array` of `Symbols`.
  # It goes over each `Symbol` and calls the `attribute` method with the 
  # `Symbol` as an argument, creating a getter method.
  def reader(*names)
  end
end
