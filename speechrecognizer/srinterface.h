#ifndef SRINTERFACE_H
#define SRINTERFACE_H

#include <speechsynthesis.h>
#include <audiocontrol.h>
#include <QString>
#include <QObject>
#include <srinterface_global.h>
class SRINTERFACESHARED_EXPORT SRInterface:public QObject
{
    Q_OBJECT
public:
    SRInterface(QObject* parent =0);
    //当前语音识别状态
    enum{
        ready,//语音识别在准备
        speeching,//语音识别正在进行
        stop//语音识别结束
    };
    int speechState;
    struct speech_rec rec;//用来接收从录音类传来的数据
    AudioControl al;//控制声音播放和录音

    SpeechSynthesis ss;//语音合成类
    // 获取speechstate
    int getSpeechState();
    /**获取speech过程中，语音信号的值（用于显示声音波形图）
     * */
    float getSpeechValue();
    //获取识别结果
    char* getSpeechResult();
    /**
     * @brief startSpeech开始识别
     * @param login_params-登陆参数
     * @param stt_session_begin_params－stt开始参数
     * @return
     */
    int doSpeech(const char* login_params,const char* stt_session_begin_params);
    /**
     * @brief compose语音合成
     * @param text－合成内容
     * @param login_params－登陆参数
     * @param tts_session_begin_params－tts开始参数
     * @return
     */
    int compose(char* text,const char* login_params,const char* tts_session_begin_params);
    //语音播报
    int play(char* filePath);
public slots:
    void slot_startRecord(const char*login_params,const char* stt_session_begin_params);
    void slot_startPlayer(char* filePath);
    void slot_stopRecord();
};

#endif // SRINTERFACE_H
