class SessionsController < ApplicationController

  def new
    redirect_to "https://api.venmo.com/v1/oauth/authorize?client_id=#{ENV['VENMO_CLIENT_ID']}&scope=access_profile&response_type=code&redirect_uri=#{request.protocol + request.host_with_port}/auth/venmo/callback"
    #redirect_to '/auth/venmo'
    #redirect_to "https://api.venmo.com/v1/oauth/authorize?client_id=#{ENV['VENMO_CLIENT_ID']}&scope=make_payments%20access_profile%20access_email%20access_phone%20access_balance&response_type=code"
  end

  def create
    #byebug
    post_params = { 'client_id' => ENV['VENMO_CLIENT_ID'], 'code' => params['code'], 'client_secret' => ENV['VENMO_CLIENT_SECRET'] }
    puts params

    uri = URI.parse("https://api.venmo.com/v1/oauth/access_token")
    uri.query = URI.encode_www_form(post_params)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.request_uri)
    token = JSON.load(http.request(req).body)

    user = User.find_or_create_by_uid(params['provider'], token['user']['id'].to_s, token['access_token'].to_s)

    reset_session
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in."
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out."
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end

end
