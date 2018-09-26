module JeraPayment
  module Services
    module Iugu
      module Invoices
        class SendEmail < JeraPayment::Services::Iugu::Base
          def initialize(resource)
            super
          end

          def call
            send_email = JeraPayment::Api::Iugu::Invoice.send_email(@resource.api_id)

            add_error(send_email[:errors]) if send_email[:errors].present?

            @resource.errors.blank?
          end
        end
      end
    end
  end
end