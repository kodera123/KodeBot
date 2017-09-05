class BotsController < ApplicationController
  def callback
    token = "EAACXWXTJk0QBADARcEcOWaUsQmXABSd4UIBg5KXEHUviE3O38yatI26ElW0iZAkbODdTi1JAhnnTcaZBU4c69Jy27AiqqX2K4Y3TqXx1RVLDBmcrhepUiFST0mG8A9oumFyn4XmRbz1xqE4lKNAog4tm847XRzuZAlHJ07BZAQZDZD"

    message = params["entry"][0]["messaging"][0]

    if message.include?("message")

      #ユーザーの発言

      sender = message["sender"]["id"]
      text = message["message"]["text"]

      endpoint_uri = "https://graph.facebook.com/v2.6/me/messages?access_token=" + token
      request_content = {recipient: {id:sender},
                         message: {text: text}
                        }

      content_json = request_content.to_json

      RestClient.post(endpoint_uri, content_json, {
        'Content-Type' => 'application/json; charset=UTF-8'
      }){ |response, request, result, &block|
        p response
        p request
        p result
      }
    else
      #botの発言
    end
  end
end
