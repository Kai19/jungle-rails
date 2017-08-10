# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Using Jungle

If you are not yet a registered user, click 'Signup' in the top right corner and fill out the registration form:

![register page](/docs/registration.png)

Or log in here:

![login page](/docs/login.png)

Once you are registered or logged in you will be taken to the index page where you will be able view all available products:

![products](/docs/index.png)

Users can click product on product-img, product name or details button to view product details

![product details](/docs/product-details.png)

Users can click add icon to add products to cart and then checkout by clicking cart icon

![user's cart](/docs/cart.png)

Users can pay with credit card using Stripe

![Stripe](/docs/stripe.png)

Order details after sucessful payment
![Order details](/docs/order-details.png)

Admin's can remove or add to existing products
![admin's products](/docs/admin-products.png)
![new product](/docs/admin-new-products.png)

Admin's can remove or add to existing categories
![admin's categories](/docs/admin-cat.png)
![new categories](/docs/admin-new-cat.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
