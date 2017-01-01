require 'uri'

module Payoneer
  class Payee
    SIGNUP_URL_API_METHOD_NAME    = 'GetToken'
    PAYEE_DETAILS_API_METHOD_NAME = 'GetPayeeDetails'

    def self.signup_url(payee_id:, redirect_url: nil, redirect_time: nil)
      payoneer_params = {
        p4: payee_id,
        p6: redirect_url,
        p8: redirect_time,
        p9: Payoneer.configuration.auto_approve_sandbox_accounts?,
        p10: true, # returns an xml response
      }

      @response = Payoneer.make_api_request(SIGNUP_URL_API_METHOD_NAME,
                                           payoneer_params)

      render_response
    end

    def self.details(payee_id:)
      payoneer_params = {
          p4: payee_id
      }

      @response = Payoneer.make_api_request(PAYEE_DETAILS_API_METHOD_NAME,
                                           payoneer_params)

      render_response
    end

    private

    def render_response
      if success?
        Response.new_ok_response(@response)
      else
        Response.new((@response['Code']), @response['Description'])
      end
    end

    def self.success?
      !response.has_key?('Code')
    end

  end
end
