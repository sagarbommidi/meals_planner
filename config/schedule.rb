
set :output, "log/schedular.log"

every '* 9 25 * *' do
  runner "SubscriptionType.send_reminder"
end

every '* 9 27 * *' do
  runner "SubscriptionType.generate_subscription_type"
end


# Learn more: http://github.com/javan/whenever
# Update your crontab locally by running the command `whenever --update-crontab meals_planner --set environment=development`