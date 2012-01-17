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
  # The `reader` method is a metamethod, and it takes an `Array` of `Symbols`.
  # It goes over each `Symbol` and calls the `attribute` method with the 
  # `Symbol` as an argument, creating a getter method.
  def reader(*names)
  end

  # The `reader!` method is a metamethod, and it takes the same arguments as `reader`.
  # The difference between the two are that `reader!` is used to define getter methods
  # for the class of an instance object.
  def reader!(*names)
  end


  # The `writer` method is a metamethod, and it takes an `Array` of `Symbols`.
  # It goes over each `Symbol` and calls the `attribute` method with the 
  # `Symbol` as an argument, creating a setter method.
  def writer(*names)
  end

  # The `writer!` method is a metamethod, and it takes the same arguments as `writer`.
  # The difference between the two are that `writer!` is used to define setter methods
  # for the class of an instance object.
  def writer!(*names)
  end


  # The `accessor` method is a metamethod, and it takes an `Array` of `Symbols`.
  # It goes over each `Symbol` and calls the `attribute` method with the 
  # `Symbol` as an argument, creating both a getter and setter method.
  def accessor(*names)
  end

  # The `accessor!` method is a metamethod, and it takes the same arguments as `accessor`.
  # The difference between the two are that `accessor!` is used to define setter/getter methods
  # for the class of an instance object.
  def accessor!(*names)
  end

  private
    # The `attribute` method is the metamethod behind `accessor`, `writer`, and `reader`.
    # It takes two `Symbols`, but has a default for the last.
    def attribute(name, type = :accessor)
      # If the `name` or `type` parameters are anything but `Symbol` classes
      # then it should raise a TypeError.
      raise TypeError unless name.is_a?(Symbol) && type.is_a?(Symbol)

      # Based on the `Symbol` passed in as `type` determine what kind of `Proc` to create.
      block = case type

        # For getter metamethods, pass along a block that accesses the instance variable
        when :reader then -> { instance_variable_get "@#{name}".to_sym }

        # For setter metamethods, pass along a block that takes a single argument and 
        # sets the instance variable to that value, finally returning `self`. The `self` 
        # return allows for cool chaining like `person.age(24).name("Katie")`
        when :writer then ->(arg) { instance_variable_set "@#{name}".to_sym, arg; self }
    end
end

# Extend the main object with the `Accessor` module to populate it with the correct
# method singleton methods.
class Object
  extend Accessor
  include Accessor
end
