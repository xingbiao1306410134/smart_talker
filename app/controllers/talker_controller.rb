class TalkerController < ApplicationController

  #   uri = URI('http://example.com/index.html')
  #   params = { :limit => 10, :page => 3 }
  #   uri.query = URI.encode_www_form(params)
  #
  #   res = Net::HTTP.get_response(uri)
  #   puts res.body if res.is_a?(Net::HTTPSuccess)
  #
  # === POST
  #
  #   uri = URI('http://www.example.com/search.cgi')
  #   res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
  #   puts res.body

  before_action :set_current_user
  def index
    if @current_user.photo_url
      @img = @current_user.photo_url
    else
      @img = '/assets/default.png'
    end

  end

  def set_current_user
    if(session[:login_time] && session[:current_user] && session[:login_time] < Time.now + 4.hours)
      @current_user = User.find(session[:current_user])
    else
      redirect_to users_url
    end
  end


  def index_ajax
    uri = URI(TULING_API)
    my_params = TULING_PARAMS.clone
    my_params[:info] = params['text']
    my_params[:userid] = @current_user.id.to_s
    response =  JSON.parse(Net::HTTP.post_form(uri, my_params).body)
    Msg.create(user_id:@current_user.id,msg:params['text'],msg_return:response.to_s)

    html = "<div class='msg row left'><div class='photo'><img src='/assets/like.png' height='50' width='40'></div><div class='msg-text'>" + response['text'] + "</div></div>"
    case response['code']
      when 100000
        render :json => {src:t_a_fun(response['text']),html:html,code:100000}.to_json
      when 200000
        render :json => {src:t_a_fun(response['text']),html:html,code:200000}.to_json
      when 302000
        render :json => {src:t_a_fun(response['text']),html:html,code:302000}.to_json
      when 308000
        render :json => {src:t_a_fun(response['text']),html:html,code:308000}.to_json
      else
        html = "<div class='msg row left'><div class='photo'><img src='/images/like.png' height='50' width='40'></div><div class='msg-text'>" + response.to_s + "</div></div>"
        render :json => {src:t_a_fun(response['text']),html:html,code:308000}.to_json
    end
  end

  def text

  end


  def t_a

  end

  def a_t
  end

  def t_a_ajax
    uri = URI(AUDIO_API)
    my_params = AUDIO_PARAMS
    my_params[:tex] = params['text']
    uri.query = URI.encode_www_form my_params
    render json: uri.to_s.to_json
  end

  def t_a_fun text
    uri = URI(AUDIO_API)
    my_params = AUDIO_PARAMS
    my_params[:tex] = text
    uri.query = URI.encode_www_form my_params
    uri.to_s
  end

  def text_ajax
    uri = URI(TULING_API)
    my_params = TULING_PARAMS.clone
    my_params[:info] = params['text']
    render json: JSON.parse(Net::HTTP.post_form(uri, my_params).body).to_json
  end

end
