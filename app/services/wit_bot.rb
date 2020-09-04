require 'wit'

class WitBot

  def initialize(message)
    @message = message
  end

  def call_api
    @client = Wit.new(access_token: ENV["WIT_TOKEN"])
    response = @client.message(@message)
    interpret(response)
  end


  def interpret(response)
    answer = ''
    intents = response["intents"]
    intents.each do |intent|
      if intent["name"] == "temperature_get"
        answer = temperature_get_answer(response)
      end
    end

    answer
  end


  def temperature_get_answer(response)
    answer = "I'm not a sorcerer --"
    if !response['entities'].nil?
      p response['entities']
      response['entities'].each do |key, array_value |
        if key == 'wit$datetime:datetime'
          word_time  = array_value.first["body"]
          answer += "#{word_time}  is anyway beyond my clustered understanding of reality "
        end
      end
    answer
    end
  end




end
