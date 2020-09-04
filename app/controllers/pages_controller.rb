class PagesController < ApplicationController
  def home
  end

  def message
    message = params[:message]
    answer = WitBot.new(message).call_api

    render json: { message: render_to_string( partial: "pages/answer_bot.html.erb", locals: {message: answer})}
  end
end
