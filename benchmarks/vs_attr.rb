require 'benchmark'

accessor_time = Benchmark.realtime do
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
end

attr_time = Benchmark.realtime do
  class Person
    attr_accessor :name, :email
    attr_reader :password
    attr_writer :encrypted_password

    def encrypt_password!
      @encrypted_password = Base64::strict_encode64(@password)
    end

  end

  contact = Person.new
  contact.name = "Kurtis Rainbolt-Greene"
  contact.email = "me+accessor@kurtisrainboltgreene.name"
  contact.email
end

puts "Benchmarks Accessor vs attr:"
puts "  - Accessor: Time elapsed #{accessor_time * 1000}ms"
puts "  - attr: Time elapsed #{attr_time * 1000}ms"