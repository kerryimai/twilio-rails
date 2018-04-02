class TwilioController < ApplicationController

  def voice
    response = Twilio::TwiML::VoiceResponse.new
    response.gather(action: '/twilio/number', method: 'GET') do |gather|
      gather.say('Please enter your account number,\nfollowed by the pound sign')
    end
    response.say('We didn\'t receive any input. Goodbye!')
    render :xml => response.to_xml
  end

  def gather
    response = Twilio::TwiML::VoiceResponse.new
    response.gather(input: 'speech dtmf', timeout: 3, num_digits: 1) do |gather|
      gather.say('Please press 1 or say sales for sales.')
    end
  end

  def number
    if params['Digits']
      response = Twilio::TwiML::VoiceResponse.new
      response.dial do |dial|
          dial.number('408-891-7592')
      end
    end
    render :xml => response.to_xml
  end

end
