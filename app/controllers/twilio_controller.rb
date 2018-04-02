class TwilioController < ApplicationController

  def voice
    response = Twilio::TwiML::VoiceResponse.new
    response.gather(action: '/twilio/number', method: 'GET') do |gather|
      gather.say('Hi there, press 1 if you would like to speak with Kerry, or press 2 if you would like to leave a voicemail followed by the pound sign')
    end
    response.say('We didn\'t receive any input. Goodbye!')
    render :xml => response.to_xml
  end


  def number
    p params['Digits'] == '2'
    response = Twilio::TwiML::VoiceResponse.new
    if params['Digits'] == '1'
      response.dial do |dial|
          dial.number('408-891-7592')
      end
    elsif params['Digits'] == '2'
      response.say('Please leave a message at the beep.\nPress the star key when finished.')
      response.record(action: '/twilio/voicemail', method: 'GET',
        max_length: 20, finish_on_key: '*')
      response.say('I did not receive a recording')
    end
    render :xml => response.to_xml
  end

def voicemail
  byebug

end


end
