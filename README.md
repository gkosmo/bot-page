Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
   This is an example of how to quickly integrate a bot (Wit.ai) to an app

   the steps:
 ---- on Home Page  views/pages/home.html

      -> tiny window with input
         - bootstrap cards
      -> user type in Question/Comment
         - text field tag
         - stimulus event
         javascript/controllers/bot_controller.js
         - fetch
      -> question is first received by server
         - routes
        post: "pages#message"
         - controller#action
      -> interpreted w/ external service
         services/wit_bot.rb
        -  API token need to be set
        .env
        -  Service class for call
        -  method takes param message
        -  Api call
      -> answer built on the interpretation
        -  Api request-response
        -  Parse response
        -  Conditionned message reply
      -> answer is return to the window as message
        - controller variable of message from service
        - is used in partial
        views/pages/_answer_bot.html.erb
        - return json partial
