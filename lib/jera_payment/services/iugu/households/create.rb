module JeraPayment
  module Services
    module Iugu
      module Households
        class Create < JeraPayment::Services::Iugu::Base
          def call
            iugu_household = JeraPayment::Api::Iugu::Household.create(JeraPayment::Parsers::Iugu::HouseholdParser.create_household(@resource), 
                                                                      @resource&.sub_account&.api_token)

            add_error(iugu_household[:errors]) if iugu_household[:errors].present?

            @resource.errors.blank?
          end
        end
      end
    end
  end
end