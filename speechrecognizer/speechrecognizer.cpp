#include <srinterface.h>
#include <returnAndGlobal.h>
SpeechRecognizer::SpeechRecognizer()
{

}
//进行登陆及开始新会话
int SpeechRecognizer::startSession(const char* login_params,const char* stt_session_begin_params,char** session_id)
{
    int ret = MSP_SUCCESS;
    int				errcode = MSP_SUCCESS;
    MSPLogin(NULL, NULL, login_params);
    if (MSP_SUCCESS != ret)	{
           qDebug()<<"MSPLogin failed , Error code"<<ret;
           return ret;
        }
    *session_id = (char*)QISRSessionBegin(NULL, stt_session_begin_params, &errcode);
    qDebug()<<"sr_session_id"<<*session_id;
    if (MSP_SUCCESS != errcode)
    {
        qDebug()<<"\nQISRSessionBegin failed! error code"<<errcode;
        return errcode;
    }
    return MSP_SUCCESS;
}

//进行语音识别
int SpeechRecognizer::startSpeechRecognizer(struct speech_rec* rec,bool* isGetResult,char** result)
{
    int ret;
    ret= QISRAudioWrite(rec->session_id,rec->data,rec->length,rec->audio_status,&rec->ep_stat,&rec->rec_stat);
    if (ret) {
        qDebug()<<"QISRAudioWrite Fail!";
        return ret;
    }

    if(rec->rec_stat==MSP_REC_STATUS_SUCCESS||rec->ep_stat==MSP_EP_AFTER_SPEECH)
    {
    *result=(char*)QISRGetResult(rec->session_id,&rec->rec_stat,0,&ret);
    qDebug()<<"result--------------------"<<*result;
    *isGetResult=true;
    }
    return MSP_SUCCESS;
}

//退出登陆及结束会话
int SpeechRecognizer::stopSession(const char* session_id)
{
    QISRSessionEnd(session_id,"normal");
    MSPLogout();
}
