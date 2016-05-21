class SubscriptionsController < ApplicationController
  def new

  end

  def create
    if params[:plan].present?
      stripe_plan_name = Subscription.get_stripe_plan_from_value(params[:plan].to_i)
    else
      flash[:error] = "Something went wrong. Please contact us."
      redirect_to new_subscription_path
    end

    customer = Stripe::Customer.create(
        :email => current_user.email,
        :description => "Silvrback Order",
        :card => params[:stripeToken],
        :plan => stripe_plan_name,
        :coupon => params[:coupon]
    )


  rescue Stripe::StripeError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  else
    c = Subscription.new
    c.user_id = current_user.id
    c.stripe_id = customer.id
    c.amount = params[:plan].to_i / 100
    c.plan = stripe_plan_name
    if c.save
      redirect_to profile_path
    else
      flash[:error] = "Something went wrong. Please try again"
      redirect_to new_subscription_path
    end

  end

  def delete

  end
end
