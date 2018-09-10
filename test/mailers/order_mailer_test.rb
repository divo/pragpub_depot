require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
   test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Store order confirmation", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal ["test@example.com"], mail.from
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Store order shipped!", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal ["test@example.com"], mail.from
  end

end
