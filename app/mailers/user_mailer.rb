class UserMailer < ActionMailer::Base
  default from: "supraja.s@imaginea.com"

  def subscription_email(user)
    @user = user
    @s_type_next = SubscriptionType.next_subscription_type
    mail(:to => "supraja.s@imaginea.com", :subject => "New subscriber for meals")
  end

  def borrow_email(user,transfer)
    @user = user
    @transfer = transfer
    @lender_email = @transfer.user.email
    @lender_name = @transfer.user.fullname   
    mail(:to => @lender_email, :subject => "Borrower for today's meal")
  end

  def new_subscription_type_email
    @s_type_next = SubscriptionType.next_subscription_type
    mail(:to => "chennai@imaginea.com", :subject => "Meals Subscription for next month")
  end

  def payment_acceptance_email(user,transfer)
    @user = user
    @transfer = transfer
    @borrower = @transfer.borrower_name
    @lender_name = @user.fullname   
    mail(:to => "supraja.s@imaginea.com", :subject => "Transfer of today's meal")
  end

  def reminder_to_admin
    date = Date.today.next_month.at_beginning_of_month
    @stype = {
      :month => I18n.localize(date, :format => "%B-%Y"),
      :no_of_days => SubscriptionType.working_days_in_month(date.to_s),
      :amount_per_day => 45
    }    
    mail(:to => "supraja.s@imaginea.com", :subject => "Reminder to Create Subscription Type")
  end

end
