module JeraPayment
  module Services
    module Iugu
      module Plans
        class Destroy < JeraPayment::Services::Iugu::Base
          def call
            iugu_plan = JeraPayment::Api::Iugu::Plan.destroy(@resource.api_id, @resource&.sub_account&.api_token)

            add_error(iugu_plan[:errors]) if iugu_plan[:errors].present?

            @resource.errors.blank?
          end
        end
      end
    end
  end
end