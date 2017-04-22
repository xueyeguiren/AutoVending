#include "srinterface.h"

SRInterface::SRInterface()
{

}

// 获取speechstate,只有speechstate为stop表示识别完成
int SRInterface:: getSpeechState()
{
    int ret;
    ret=al.getStructRec(&rec);
    if(ret<0)
        return GETSPEECHSTATE_FAIL;
    if(rec.isGetSpeechResult)
        speechState=stop;
    else if(rec.start)
        speechState=speeching;
    else
        speechState=ready;
    qDebug()<<"getSpeechState"<<speechState;
    return this->speechState;
}

/**获取speech过程中，语音信号的值（用于显示声音波形图）
 * valueNum--返回的信号值的数量（即波形图分辨率）
 * */
float SRInterface::getSpeechValue()
{
//    rec=al.getStructRec(&rec);
    return rec.value;
}

//获取识别结果
char* SRInterface::getSpeechResult()
{
    return rec.result;
}

//开始识别
int SRInterface::doSpeech(const char* login_params,const char* stt_session_begin_params)
{
    speechState=ready;
    int ret;
    qDebug()<<"startSpeech srinterface";
    ret=al.startRecord(login_params,stt_session_begin_params);
    if(ret<0)
    {
        return DOSPEECH_FAIL;
    }
    return DOSPEECH_SUCCESS;
}

//语音合成
int SRInterface::compose(char* text,const char* login_params,const char* tts_session_begin_params)
{
    int ret=ss.StartCompose(text,login_params,tts_session_begin_params);
    if(ret<0)
    {
        return COMPOSE_FAIL;
    }
    return COMPOSE_SUCCESS;
}

//语音播报
int SRInterface::play(char* filePath)
{
    int ret;
    ret=al.startPlayer(filePath);
    if(ret<0)
        return PLAY_FAIL;
    return PLAY_SUCCESS;
}
