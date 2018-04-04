module CallHelper
  def call_status(option, recording_url)
    status = {
      '1' => 'called Kerry',
      '2' => 'left a voicemail',
      'hangup' => 'hung up'
    }
    phrase = status[option]
    if !recording_url && option == '1'
      phrase = 'tried to call Kerry'
    end
    phrase || 'called'
  end

  def record_copy(option)
    option == '1' ? 'Recording' : 'Voicemail'
  end

  def city_cap(city)
    if city
      city.split(" ").map {|x| x.capitalize}.join(" ")
    else
      'UnKnown'
    end
  end
end
