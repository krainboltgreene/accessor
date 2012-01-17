require 'minitest/autorun'
require_relative 'helper'

class TestAccessor < MiniTest::Unit::TestCase

  def setup
    @iperson = Person.new
  end

  def test_person_class_has_accessor_method
    assert_respond_to Person, :accessor
  end

  def test_person_class_has_writer_method
    assert_respond_to Person, :writer
  end

  def test_person_class_has_reader_method
    assert_respond_to Person, :reader
  end

  def test_person_has_name_accessor
    assert_respond_to @iperson, :name
  end

  def test_person_has_email_accessor
    assert_respond_to @iperson, :email
  end

  def test_person_has_password_writer
    assert_respond_to @iperson, :password
  end

  def test_person_has_encrypted_password_reader
    assert_respond_to @iperson, :encrypted_password
  end

  def test_cant_read_password_ivariable
    assert_raises(ArgumentError) { @iperson.password }
  end

  def test_cant_write_encrypted_password_ivariable
    assert_raises(ArgumentError) { @iperson.encrypted_password("test") }
  end

  def test_person_has_accessor_method
    assert_respond_to @iperson, :accessor!
  end

  def test_person_has_writer_method
    assert_respond_to @iperson, :writer!
  end

  def test_person_has_reader_method
    assert_respond_to @iperson, :reader!
  end

  def test_iaccessor_defines_getter_method
    @iperson.accessor! :age
    assert_respond_to @iperson, :age
  end

  def test_iaccessor_defines_setter_method
    @iperson.accessor! :age
    assert_send [@iperson, :age, 23]
  end

  def test_ireader_defines_getter_method
    @iperson.reader! :age
    assert_respond_to @iperson, :age
  end

  def test_iwritter_defines_setter_method
    @iperson.writer! :age
    assert_send [@iperson, :age, 23]
  end

  def test_iaccessor_requires_names
    assert_raises(ArgumentError) { @iperson.accessor! }
  end

  def test_ireader_requires_names
    assert_raises(ArgumentError) { @iperson.reader! }
  end

  def test_iwriter_requires_names
    assert_raises(ArgumentError) { @iperson.writer! }
  end
end