class ChargesController < ApplicationController

  def new
     @stripe_btn_data = {
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "RailsWiki Membership - #{current_user.name || curent_user.email}",
       plan: 'wiki-premium'
     }
  end

  def create
 
    @amount = 9_00

    # Creates a Stripe Customer object, for associating
    # with the charge

    # Associate user to an existing striper customer (if present)
    Stripe::Customer.all.each do |stripe_customer|
        if customer.email == current_user.email
            customer = stripe_customer
        else
            customer = Stripe::Customer.create(
                email: current_user.email,
                card: params[:stripeToken]
            )
        end
    end
    
    # Where the real magic happens
    charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "RailsWiki Membership - #{current_user.email}",
     currency: 'usd',
    )

    if current_user.update_attribute(:membership, 'premium')
        flash[:success] = "Thanks, #{current_user.name || current_user.email}! Enjoy your premium membership benefits."
        redirect_to articles_path # or wherever
    end

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    end
end
