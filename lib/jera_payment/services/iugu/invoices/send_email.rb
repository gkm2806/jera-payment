module JeraPayment
  module Services
    module Iugu
      module Invoices
        class SendEmail < JeraPayment::Services::Iugu::Base
          def call
            send_email = JeraPayment::Api::Iugu::Invoice.send_email(@resource.api_id,
                                                                    @resource&.sub_account&.api_token)

            add_error(send_email[:errors]) if send_email[:errors].present?

            @resource.errors.blank?
          end
        end
      end
    end
  end
end