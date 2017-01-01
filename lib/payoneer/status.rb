module Payoneer
  class Status
    def create_payout
      {
          '000' =>    'Processed successfully',
          '002' =>    'Payee does not exist',
          '003' =>    'Insufficient funds',
          '004' =>    'Payment ID already exists',
          '011' =>    'Funding not enabled',
          '010' =>    'Payee is inactive',
          '030' =>    'Currency Mismatch',
          '001m' =>   'Minimum/ maximum loading amount / Amount to load is less or equal to zero',
          '002b' =>   'Internal error',
          '002t' =>   'Internal error',
          '002em' =>  'Payee does not exist',
          '006n' =>   'Internal error',
          '007d' =>   'Internal error',
          '007f' =>   'Internal error',
          '007g' =>   'Internal error',
          'PE1028' => 'Invalid currency'
      }
    end

    def payout_status
      {
          '000' =>    'Processed successfully',
          'PE1011' => 'Required field is missing',
          'PE1026' => 'Invalid Payment ID or Payee ID'
      }
    end

    def cancel_payout
      {
          '000' =>    'Payment cancelled successfully',
          '002' =>    'Payment has already been processed',
          '003' =>    'Payment has already been cancelled / rejected',
          '004' =>    'Failed to cancel payment',
          'PE1026' => 'Invalid payment ID'
      }
    end

    def payee_details
      {
          '000' => 'Processed successfully',
          '002' => 'Payee does not exist'
      }
    end

    def register_payee
      {
          '000' =>      'OK',
          '001' =>      'Field format is invalid or is not supported',
          '005' =>      'Internal error',
          '006' =>      'Internal error',
          '044' =>      'Payee ID already exists',
          '046' =>      'Email already exists',
          'PE1010' =>   'Unauthorized action',
          'PE1011' =>   'Required field is missing',
          'A00B556F' => 'Unauthorized access or invalid parameters. Please check IP address and parameters',
          '4B501FF5' => 'Cannot find command or wrong method name'
      }
    end
  end
end
