![Jera Logo](http://jera.com.br/images/logo-jera-header.png)

JeraPayment makes integrations with Iugu, MercadoPago and Pagar.me API's.

It's composed for:

  * [Customer](#customers): model responsible for register the api customers.
  * [CreditCard](#credit_cards): model responsible for register the customers payment methods.
  * [Invoice](#invoices): model responsible for register the api invoices
  * [Charge](#charges): model responsible for payment of invoices.
  * [Plan](#plans): model responsible for register the account plans.
  * [Subscription](#subscriptions): model responsible for register the subscriptions for plans.


## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'jera-payment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jera-payment

Next, you need to run the installer. You can do it with this command:
~~~bash
$ rails generate jera_payment:install
~~~

That command will create the necessary migrations and the initialize file. The file will be like this:
```ruby
#this is the intilizer
#here you will set up the jera payment configuration
JeraPayment.setup do |config|
  config.api = YOUR_API # :pagar_me, :iugu, :mercado_pago
  config .api_key = YOUR_PRODUCTION_API_KEY # string
  config.api_key_test = YOUR_DEVELOPMENT_API_KEY # string
  config.account_id = YOUR_API_ACCOUNT_ID # string
  config.is_test = TRUE_OF_FALSE # boolean
end
```

Then, you need to run the generator and inform the model to associate with customer/marketplace. You can do it with this command:
~~~bash
$ rails generate jera_payment MODEL_NAME Customer SubAccount
~~~

## Customer

> Model responsible for register the api customers.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customerable_id | BigInt | Your model's ID that has_one JeraPayment::Customer |
| customerable_type | BigInt | Your model's name that has_one JeraPayment::Customer |
| api_id | String | Customer's API ID |
| email | String | Customer email |
| name | String | Customer name |
| phone | String | Customer phone |
| cpf_cpnj | String | Customer CPF/CNPJ |
| current_credit_card_id | BigInt | Your project's Credit Card Id |

## CreditCard

> Model responsible for register the customers payment methods.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customer_id | BigInt | Your project's Customer Id  |
| api_id | String | The payment method API's ID |
| brand | String | Credit Card's Brand |
| number | String | Credit Card's Number |
| first_name | String | Credit Card's First Name |
| last_name | String | Credit Card's Last Name |
| cvv | String | Credit Card's CVV |
| month | String | Credit Card's month expiration |
| year | String | Credit Card's year expiration |
| description | String | Credit Card's description |
| test | Boolean | Credit Card is test? |

## Invoice

> Model responsible for register the api invoices

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| customer_id | BigInt | Your project's Customer Id |
| api_id | String | Invoice's API ID |
| status | Enumerize | Invoice Status (pending, paid, canceled, partially_paid, refunded, expired, authorized, in_protest, chargeback, in_analysis) |
| email | String | Customer e-mail |
| cc_emails | String | -- |
| due_date | String | -- |
| cc_emails | String | -- |
| ensure_workday_due_date | Boolean | -- |
| items | Text (send as hash) | -- |
| total_cents | Int | -- |
| discount_cents | Int | -- |
| payable_with | String | -- |
| return_url | String | -- |
| expired_url | String | -- |
| notification_url | String | -- |
| fines | Noolean | -- |
| late_payment_fine | String | -- |
| per_day_interest | Boolean | -- |
| ignore_due_email | Boolean | -- |
| ignore_canceled_email | Boolean | -- |
| current_fines_option | Boolean | -- |
| keep_early_payment_discount | Boolean | -- |
| subscription_api_id | String | -- |
| credits | Int | -- |
| early_payment_discount | Boolean | -- |
| early_payment_discounts | Text (send as hash) | -- |
| cpf_cnpj | String | -- |
| name | String | -- |
| phone_prefix | String | -- |
| phone | String | -- |
| email | String | -- |
| zip_code | String | -- |
| street | String | -- |
| number | String | -- |
| neighborhood | String | -- |
| city | String | -- |
| state | String | -- |
| country | String | -- |
| complement | String | -- |
| paid_at | String | -- |
| secure_url | String | -- |
| digitable_line | String | -- |
| barcode_data | String | -- |
| barcode | String | -- |
| duplicated | Boolean | -- |

## Charge

> Model responsible for register the payment.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| invoice_id | BigInt | Your project's Invoice Id |
| method | String | -- |
| token | String | -- |
| customer_payment_method_api_id | String | Your API Credit Card Id |
| restrict_payment_method | Boolean | -- |
| customer_api_id | String | -- |
| email | String | -- |
| months | Int | -- |
| discount_cents | Int | -- |
| bank_slip_extra_days | Int | -- |
| keep_dunning | Boolean | -- |
| items | Text (send as hash) | -- |
| cpf_cnpj | String | -- |
| name | String | -- |
| phone_prefix | String | -- |
| phone | String | -- |
| email | String | -- |
| zip_code | String | -- |
| street | String | -- |
| number | String | -- |
| neighborhood | String | -- |
| city | String | -- |
| state | String | -- |
| country | String | -- |
| complement | String | -- |
| paid_at | String | -- |
| secure_url | String | -- |
| digitable_line | String | -- |
| barcode_data | String | -- |
| barcode | String | -- |
| duplicated | Boolean | -- |

## Plan

> Model responsible for register the account plans.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Plan's API ID |
| name | String | Plan's name |
| identifier | String | Plan's identifier |
| interval | Int | Number interval for payment |
| interval_type | String | Interval type |
| value_cents | String | Plan's price in cents |
| payable_with | String | Payment method disponible |
| features | Text (send as hash) | -- |

## Subscription

> Model responsible for register the subscriptions for plans.

### Attributes

| Attribute|    Type    | Description |
|----------|------------|-------------|
| api_id | String | Subscription's API ID |
| customer_id | BigInt | Your project's Subscription Id |
| plan_identifier | String | Plan's identifier |
| only_on_charge_success | Boolean | -- |
| ignore_due_email | Boolean | -- |
| payable_with | String | -- |
| credits_based | Boolean | -- |
| price_cents | Int | -- |
| credits_cycle | Int | -- |
| credits_min | Int | -- |
| subitems | Text (send as hash) | -- |
| custom_variables | Text (send as hash) | -- |
| suspended | Boolean | -- |
| active | Boolean | -- |
| skip_charge | Boolean | -- |
| credits | String | -- |


### Model Methods
  * The models are validate according to API.
  * Most of the actions are send to the api before creating a record (those that aren't will be warned).

#### CUSTOMER
  * CREATE
    ```ruby
    JeraPayment::Customer.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.create_customer(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Customer.first.update(SCHEMA_ATTRIBUTES)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Customer.first.destroy
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.destroy
    ```

#### CREDIT CARD
  * CREATE
    ```ruby
    User.first.customer.credit_cards.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    User.first.customer.credit_cards.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    User.first.customer.credit_cards.first.destroy
    ```

#### INVOICE
  * CREATE
    ```ruby
    JeraPayment::Invoice.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.create(SCHEMA_ATTRIBUTES)
    ```
  * CANCEL
    ```ruby
    JeraPayment::Invoice.first.cancel
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.first.cancel
    ```
  * CAPTURE
    ```ruby
    JeraPayment::Invoice.first.capture
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.first.capture
    ```
  * REFUND
    ```ruby
    JeraPayment::Invoice.first.refund
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.first.refund
    ```
  * DUPLICATE
    ```ruby
    JeraPayment::Invoice.first.duplicate(attributes) # attributes is HASH
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.first.duplicate(attributes) # attributes is HASH
    ```
  * SEND EMAIL
    ```ruby
    JeraPayment::Invoice.first.send_email
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.invoices.first.send_email
    ```

#### CHARGE
  * CREATE
    ```ruby
    User.first.customer.invoices.first.create_charge(SCHEMA_ATTRIBUTES)
    ```

#### PLAN
  * CREATE
    ```ruby
    JeraPayment::Plan.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Plan.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Plan.first.destroy
    ```
#### SUBSCRIPTION
  * CREATE
    ```ruby
    JeraPayment::Subscription.create(SCHEMA_ATTRIBUTES)
    ```
    OR ( if you wanna link to your model (User) )
    ```ruby
    User.first.customer.subscriptions.create(SCHEMA_ATTRIBUTES)
    ```
  * UPDATE
    ```ruby
    JeraPayment::Subscription.first.update(SCHEMA_ATTRIBUTES)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.update(SCHEMA_ATTRIBUTES)
    ```
  * DESTROY
    ```ruby
    JeraPayment::Subscription.first.destroy
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.destroy
    ```
  * ACTIVATE
    ```ruby
    JeraPayment::Subscription.first.activate
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.activate
    ```
  * SUSPEND
    ```ruby
    JeraPayment::Subscription.first.suspend
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.suspend
    ```
  * CHANGE PLAN SIMULATION
    ```ruby
    JeraPayment::Subscription.first.change_plan_simulation(plan_identifier)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.change_plan_simulation(plan_identifier)
    ```
  * CHANGE PLAN
    ```ruby
    JeraPayment::Subscription.first.change_plan(plan_identifier)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.change_plan(plan_identifier)
    ```
  * ADD CREDITS
    ```ruby
    JeraPayment::Subscription.first.add_credits(credits)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.add_credits(credits)
    ```
  * REMOVE CREDITS
    ```ruby
    JeraPayment::Subscription.first.remove_credits(credits)
    ```
    OR ( if your customer is linked to a model record (User) )
    ```ruby
    User.first.customer.subscriptions.first.remove_credits(credits)
    ```


### API Methods
  * All the access_token are only filth when using marketplace api token.
  * All the arguments passed to the methods are directly send to Iugu's API.

#### IUGU

##### CUSTOMER

  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Customer.index(query = nil, access_token = nil) # query and access_token can be nil
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Customer.show(customer_api_id, access_token = nil) # access_token can be nil
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Customer.create(body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Customer.update(customer_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Customer.destroy(customer_api_id, access_token = nil) # access_token can be nil
    ```

##### PAYMENT TOKEN (First part for credit card creation)
* CREATE
  ```ruby
  JeraPayment::Api::Iugu::PaymentToken.create(body, access_token = nil) # body is HASH and access_token can be nil
  ```

##### PAYMENT METHOD (Last part for credit card creation)
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.index(customer_api_id, access_token = nil) # access_token can be nil
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.show(customer_api_id, payment_method_api_id, access_token = nil) # access_token can be nil
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.create(customer_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.update(customer_api_id, payment_method_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::PaymentMethod.destroy(customer_api_id, payment_method_api_id, access_token = nil) # access_token can be nil
    ```

#### INVOICE
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Invoice.index(query = nil, access_token = nil) # query and access_token can be nil
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Invoice.show(invoice_api_id, access_token = nil) # access_token can be nil
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.create(body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * DUPLICATE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.duplicate(invoice_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * CAPTURE
    ```ruby
    JeraPayment::Api::Iugu::Invoice.capture(invoice_api_id, access_token = nil) # access_token can be nil
    ```
  * CANCEL
    ```ruby
    JeraPayment::Api::Iugu::Invoice.cancel(invoice_api_id, access_token = nil) # access_token can be nil
    ```
  * REFUND
    ```ruby
    JeraPayment::Api::Iugu::Invoice.refund(invoice_api_id, access_token = nil) # access_token can be nil
    ```
  * SEND EMAIL
    ```ruby
    JeraPayment::Api::Iugu::Invoice.send_email(invoice_api_id, access_token = nil) # access_token can be nil
    ```

#### CHARGE
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Charge.create(body, access_token = nil) # body is HASH and access_token can be nil
    ```

##### PLAN
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Plan.index(query = nil, access_token = nil) # query and access_token can be nil
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Plan.show(plan_api_id, access_token = nil) # access_token can be nil
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Plan.create(body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Plan.update(plan_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Plan.destroy(plan_api_id, access_token = nil) # access_token can be nil
    ```

##### SUBSCRIPTION
  * INDEX
    ```ruby
    JeraPayment::Api::Iugu::Subscription.index(query = nil, access_token = nil) # query and access_token can be nil
    ```
  * SHOW
    ```ruby
    JeraPayment::Api::Iugu::Subscription.show(subscription_api_id, access_token = nil) # access_token can be nil
    ```
  * CREATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.create(body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * UPDATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.update(subscription_api_id, body, access_token = nil) # body is HASH and access_token can be nil
    ```
  * DESTROY
    ```ruby
    JeraPayment::Api::Iugu::Subscription.destroy(subscription_api_id, access_token = nil) # access_token can be nil
    ```
  * ACTIVATE
    ```ruby
    JeraPayment::Api::Iugu::Subscription.activate(subscription_api_id, access_token = nil) # access_token can be nil
    ```
  * SUSPEND
    ```ruby
    JeraPayment::Api::Iugu::Subscription.suspend(subscription_api_id, access_token = nil) # access_token can be nil
    ```
  * CHANGE PLAN SIMULATION
    ```ruby
    JeraPayment::Api::Iugu::Subscription.change_plan_simulation(subscription_api_id, plan_identifier, access_token = nil) # access_token can be nil
    ```
  * CHANGE PLAN
    ```ruby
    JeraPayment::Api::Iugu::Subscription.change_plan(subscription_api_id, plan_identifier, access_token = nil) # access_token can be nil
    ```
  * ADD CREDITS
    ```ruby
    JeraPayment::Api::Iugu::Subscription.add_credits(subscription_api_id, body, access_token = nil) #body is HASH and access_token can be nil
    ```
  * REMOVE CREDITS
    ```ruby
    JeraPayment::Api::Iugu::Subscription.remove_credits(subscription_api_id, body, access_token = nil) #body is HASH and access_token can be nil
    ```