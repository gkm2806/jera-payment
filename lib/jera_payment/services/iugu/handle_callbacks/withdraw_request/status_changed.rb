module Iugu
  module HandleCallbacks
    module WithdrawRequest
      class StatusChanged
        def call
          super

          @withdrawal = JeraPayment::Withdrawal.find_by(api_id: @params['data']['id'])

          return 404 unless @withdrawal.present?

          @withdrawal.update(status: @params['data']['status'], feedback: @params['data']['feedback'])

          200
        end

      end
    end
  end
end
