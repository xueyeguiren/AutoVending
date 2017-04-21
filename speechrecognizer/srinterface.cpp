#include "srinterface.h"

SRInterface::SRInterface()
{

}

// 获取speechstate,只有speechstate为stop表示识别完成
int SRInterface:: getSpeechState()
{
    rec=al.getStructRec();
    if(rec.isGetSpeechResult)
        speechState=stop;
    else if(rec.start)
        speechState=speeching;
    speechState=ready;
    qDebug()<<"getSpeechState";
    return this->speechState;
}

/**获取speech过程中，语音信号的值（用于显示声音波形图）
 * valueNum--返回的信号值的数量（即波形图分辨率）
 * */
float SRInterface::getSpeechValue()
{
    rec=al.getStructRec();
    return rec.value;
}

//获取识别结果
char* SRInterface::getSpeechResult()
{
    return rec.result;
}

//开始识别
int SRInterface::startSpeech(const char* login_params,const char* stt_session_begin_params)
{
    qDebug()<<"startSpeech srinterface";
    al.startRecord(login_params,stt_session_begin_params);
    speechState=ready;
}

//语音合成
int SRInterface::compose(char* text,const char* login_params,const char* tts_session_begin_params)
{

}

//语音播报
int SRInterface::play(char* filePath)
{

}
