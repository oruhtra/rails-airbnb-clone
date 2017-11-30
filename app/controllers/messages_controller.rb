class MessagesController < ApplicationController
  def index

  end

  def create

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
