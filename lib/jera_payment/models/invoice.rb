require 'enumerize'

class JeraPayment::Invoice < ActiveRecord::Base
  include JeraPayment::Concerns::ResourceCallbacks
  include JeraPayment::Concerns::InvoiceMethods
  extend Enumerize

  attr_readonly :api_id, :customer, :email, :cc_emails, :due_date,
                :ensure_workday_due_date, :items, :total_cents, :discount_cents,
                :payable_with, :return_url, :expired_url, :notification_url, :fines,
                :late_payment_fine, :per_day_interest, :ignore_due_email, :subscription_api_id,
                :credits, :early_payment_discount, :early_payment_discounts, :cpf_cnpj, :name,
                :phone_prefix, :phone, :email, :zip_code, :street, :number, :neighborhood, :city,
                :state, :country, :complement, :paid_at, :secure_url, :digitable_line, :barcode_data, :barcode

  self.table_name = 'jera_payment_invoices'

  enumerize :status, in: { pending: 0, paid: 1, canceled: 2, partially_paid: 3, refunded: 4, expired: 5,
                          authorized: 6, in_protest: 7, chargeback: 8, in_analysis: 9 }, predicates: true, scope: true, default: :pending

  belongs_to :customer, class_name: 'JeraPayment::Customer', optional: true

  has_one :charge, class_name: 'JeraPayment::Charge'

end