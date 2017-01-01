module Payoneer
  class Payout
    CREATE_PAYOUT_API_METHOD_NAME      = 'PerformPayoutPayment'
    GET_PAYMENT_STATUS_API_METHOD_NAME = 'GetPaymentStatus'
    CANCEL_PAYMENT_API_METHOD_NAME     = 'CancelPayment'

    def self.create(program_id:, payment_id:, payee_id:, amount:, description:, payment_date: Time.now, currency: 'USD')
      payoneer_params = {
        p4: program_id,
        p5: payment_id,
        p6: payee_id,
        p7: '%.2f' % amount,
        p8: description,
        p9: payment_date.strftime('%m/%d/%Y %H:%M:%S'),
        Currency: currency,
      }

      @response = Payoneer.make_api_request(CREATE_PAYOUT_API_METHOD_NAME,
                                           payoneer_params)

      render_response
    end

    def self.status(payee_id:, payment_id:)
      payoneer_params = {
          p4: payee_id,
          p5: payment_id
      }

      @response = Payoneer.make_api_request(GET_PAYMENT_STATUS_API_METHOD_NAME,
                                           payoneer_params)

      render_response
    end

    def self.cancel(payment_id:)
      payoneer_params = {
          p4: payment_id
      }

      @response = Payoneer.make_api_request(CANCEL_PAYMENT_API_METHOD_NAME,
                                           payoneer_params)

      render_response
    end

    private

    def render_response
      if success?
        Response.new_ok_response(@response)
      else
        Response.new((@response['Result'] || @response['Status']), @response['Description'])
      end
    end

    def self.success?
      @response['Result'].to_s == '000' || @response['Status'].to_s == '000'
    end
  end
end
