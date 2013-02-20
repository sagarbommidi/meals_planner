module ApplicationHelper

  def help_text
    "We make it possible to get your money back if you dont take your meal (Provided someone borrows your meal)"
  end

  def active_class(controller_name)
    (params[:controller] == controller_name) ? "active" : ""
  end

  def lender_name(transfer)
    (transfer.lender_id == current_user.id) ? "You" : transfer.user.fullname
  end

  def booking_status(transfer)
    transfer.booking_status ? transfer.borrower_name : "None"
  end
end
