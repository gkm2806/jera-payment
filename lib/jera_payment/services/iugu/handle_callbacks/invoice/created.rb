module JeraPayment
  module Services
    module Iugu
      module HandleCallbacks
        module Invoice
          class Created < JeraPayment::Services::Iugu::HandleCallbacks::Invoice::Base
            def initialize(params)
              super
            end

            def call
              super
            end
            
          end
        end
      end
    end
  end
end