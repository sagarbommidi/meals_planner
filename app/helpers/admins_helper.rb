module AdminsHelper

  def payment_status(subscription)
    subscription.payment_status ? "Paid" : "Not Paid"
  end
end
