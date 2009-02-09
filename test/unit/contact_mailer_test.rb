require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  tests ContactMailer
  def test_contact_form
    @expected.subject = 'ContactMailer#contact_form'
    @expected.body    = read_fixture('contact_form')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ContactMailer.create_contact_form(@expected.date).encoded
  end

end
