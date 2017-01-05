require 'ox'

class XmlBuilder
  attr_reader :args, :xml

  def initialize(_args)
    @args = _args
    @xml = ''
  end

  def create
    @xml = Ox::Document.new(version: '1.0')
    details = Ox::Element.new('Details')
    @xml << details

    apuid = Ox::Element.new('apuid')
    apuid << @args[:payee_id]
    details << apuid

    registration_mode = Ox::Element.new('RegistrationMode')
    registration_mode << '2'
    details << registration_mode

    first_name = Ox::Element.new('firstName')
    first_name << @args[:user_first_name].to_s.gsub('-', ' ')
    details << first_name

    last_name = Ox::Element.new('lastName')
    last_name << @args[:user_last_name].to_s.gsub('-', ' ')
    details << last_name

    address = Ox::Element.new('address1')
    address << @args[:user_address]
    details << address

    city = Ox::Element.new('city')
    city << @args[:user_city]
    details << city

    country_code = @args[:user_country].to_s.upcase
    country = Ox::Element.new('country')
    country << country_code
    details << country

    if country_code == 'US'
      state = Ox::Element.new('state')
      state << @args[:user_state]
      details << state
    end

    zipcode = Ox::Element.new('zipCode')
    zipcode << @args[:user_zipcode]
    details << zipcode

    phone = Ox::Element.new('phone')
    phone << @args[:user_phone]
    details << phone

    email = Ox::Element.new('email')
    email << @args[:user_email]
    details << email

    session_id = Ox::Element.new('SessionID')
    session_id << @args[:session_id]
    details << session_id

    redirect_url = Ox::Element.new('RedirectURL')
    redirect_url << @args[:redirect_url]
    details << redirect_url

    redirect_time = Ox::Element.new('RedirectTime')
    redirect_time << @args[:redirect_time].to_s
    details << redirect_time

    transfer_method = Ox::Element.new('TransferMethod')
    transfer_type   = Ox::Element.new('Type')
    transfer_type << '1'
    transfer_method << transfer_type
    details << transfer_method

    "<?xml version=\"1.0\" encoding=\"utf-8\"?>#{Ox.dump(@xml)}"
  end
end