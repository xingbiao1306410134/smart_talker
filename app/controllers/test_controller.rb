class TestController < ApplicationController
  def index
    # hash = {grant_type:'client_credentials',client_id:'sVSQv77K5UYLFRzWyiv4DQ10',client_secret:'ff84ff9461f55580febce82d0dfdb71f'}
    # @body = RestClient.post()
    #
    # {"access_token"=>"24.de2f362cc11e89a85b4bd331c823e75a.2592000.1496717495.282335-9544644",
    # "session_key"=>"9mzdX7/cp4w/3lZnRUyXlOwv6LWjeiha9p0/Vfa1t9xbLjulMWU9uR8z0sOCmKvzu/rMF+9DFPSsrMnpociHL49PtPdf",
    # "scope"=>"public audio_voice_assistant_get audio_tts_post wise_adapt lebo_resource_base lightservice_public hetu_basic lightcms_map_poi kaidian_kaidian wangrantest_test wangrantest_test1 bnstest_test1 bnstest_test2 vis-classify_flower",
    # "refresh_token"=>"25.97eb8cbe817d89a82eb4528a47f59b51.315360000.1809485495.282335-9544644",
    # "session_secret"=>"4674d2f9483d427c3d635ea5e14c90e5",
    # "expires_in"=>2592000}
    hash = {
            tex:'你好',                                                                    #文本
            lan:'zh',                                                                     #语言
            tok:'24.de2f362cc11e89a85b4bd331c823e75a.2592000.1496717495.282335-9544644',  #access_token
            ctp:1,                                                                        #客户端类型
            cuid:'1',                                                                     #标识用户
            spd:5,                                                                        #语速
            pit:5,                                                                        #语调
            vol:5,                                                                        #音量
            perl:0                                                                        #发音人
    }

    audio_api = 'http://tsn.baidu.com/text2audio'

    if params['tex']
      hash[:tex] = params['tex']
      audio = RestClient.post(audio_api,hash)
      # render audio.body, :content_type => 'audio/mp3'
      return
    end
  end
end
