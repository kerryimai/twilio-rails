class CallsController < ApplicationController

  before_action :find_call, except: [:create, :index]

  def create
    response = Twilio::TwiML::VoiceResponse.new
    response.gather(action: '/number', method: 'GET') do |gather|
      gather.say(Conversation::OPTIONS)
    end
    response.say(Conversation::NO_INPUT)
    find_or_create_user
    if @caller.save
      @caller.outbound_calls.create!(call_params)
    else
      Call.create!(call_params)
    end
    render :xml => response.to_xml
  end


  def number
    response = Twilio::TwiML::VoiceResponse.new
    @call.update(option: params[:Digits])
    if params['Digits'] == '1'
      response.dial(record: 'record-from-ringing-dual',
                    action: '/end_of_call',
                    method: 'GET'
                    ) do |dial|
          dial.number(Conversation::KERRY_NUMBER)
      end
    elsif params['Digits'] == '2'
      response.say(Conversation::VOICEMAIL)
      response.record(action: '/end_of_call', method: 'GET',
        max_length: 20)
    end
    render :xml => response.to_xml
  end

  def end_of_call
    @call.update(call_params)
    head :ok
  end

  def index
    @calls = Call.all || []
  end

  private

    def find_or_create_user
      @caller = User.find_by(number: params[:Caller]) || User.new(user_params)
    end

    def user_params
      params.permit(:Caller, :FromCity, :FromState, :CallerCountry);
    end

    def call_params
      params.permit(:CallSid, :RecordingDuration, :RecordingUrl);
    end

    def find_call
      @call = Call.find_by(call_sid: params[:CallSid])
    end


end
