class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  AUDIO_PARAMS= {
      tex:'你好',                                                                    #文本
      lan:'zh',                                                                     #语言
      tok:'24.de2f362cc11e89a85b4bd331c823e75a.2592000.1496717495.282335-9544644',  #access_token
      ctp:1,                                                                        #客户端类型
      cuid:'1',                                                                     #标识用户
      spd:5,                                                                        #语速
      pit:7,                                                                        #语调
      vol:9,                                                                        #音量
      perl:0                                                                        #发音人
  }
  AUDIO_API= 'http://tsn.baidu.com/text2audio'
  ACCESS_TOKEN_PARAMS = {grant_type:'client_credentials',client_id:'sVSQv77K5UYLFRzWyiv4DQ10',client_secret:'ff84ff9461f55580febce82d0dfdb71f'}
  ACCESS_TOKEN_API = 'openapi.baidu.com/oauth/2.0/token?'


  TULING_API = 'http://openapi.tuling123.com/openapi/api'
  TULING_PARAMS = {
      key:'f3ac3a8c981243598956f029857a4520',
      info:'你好',
      loc:'上海',
      userid:'1'
  }



end
