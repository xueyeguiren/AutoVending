#ifndef SPEECHRECOGNIZER_H
#define SPEECHRECOGNIZER_H

#include <QObject>
#include <qisr.h>
#include <msp_cmn.h>
#include <msp_errors.h>
#include <QDebug>
#include <QAudioInput>
#include <QMouseEvent>
#include <returnAndGlobal.h>

class SRInterface;
class AudioLevels;
class SpeechRecognizer
{
public:
    explicit SpeechRecognizer();

    //进行登陆及开始新会话
    int  startSession(const char* login_params,const char* stt_session_begin_params,char** session_id);
    //进行语音识别
    int startSpeechRecognizer(struct speech_rec* rec,bool* isGetResult,char** result);
    //退出登陆及结束会话
    int stopSession(const char* session_id);
};

#endif // SPEECHRECOGNIZER_H
