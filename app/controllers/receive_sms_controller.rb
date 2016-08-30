class ReceiveSmsController < ApplicationController

  def spam
    1.upto(params[:number].to_i) do |i|
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/#{params[:senderAddress]}/requests")
      uri.query = "access_token=#{params[:access_token]}"
      @response = Net::HTTP.post_form(uri, {"address" => params[:address], "message" => "mga nakain ni erika: "+i.to_s})
      logger.info i
    end

  end

  def receive
    if !params[:inboundsmsmessagelist].nil?
      #ito yung code bahala ka na dito
      @message = params[:message]
      spam
    end
  end
end
