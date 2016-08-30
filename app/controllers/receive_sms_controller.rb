class ReceiveSmsController < ApplicationController



  def receive
    if !params[:inboundsmsmessagelist].nil?
      #ito yung code bahala ka na dito
      @message = params[:inboundsmsmessagelist][:inboundSMSMessage][:message]
      render html: 'hello, world!' + @message
    end
  end
end
