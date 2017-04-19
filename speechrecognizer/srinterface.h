#ifndef SRINTERFACE_H
#define SRINTERFACE_H

#include <global.h>
#include <processmysql.h>
#include <javabeen.h>
#include <audioplayer.h>
#include <speechsynthesis.h>
#include <audiolevelsiodevice.h>
#include <speechrecognizer.h>
#include <audiolevels.h>
#include <QString>

class SRInterface
{
public:
    SRInterface();
    struct Global:: QueryResult handleSpeech(char* result);
    int queryGoods(struct Global::QueryResult* qr, QString string);
    int queryServer(struct Global::QueryResult* qr, QString string);
//    void startSpeech(char* resul);
    void SpeechStart(char* result);
//    static void* newThreadFun(void* arg);
    //当前语音识别状态
    enum{
        ready,//语音识别在准备
        speeching,//语音识别正在进行
        stop//语音识别结束
    };
    int speechState;
    struct Global::speech_rec* rec_record;//用来接收从录音类传来的数据
    AudioLevelsIODevice m_device;
    AudioLevels as;
    SpeechRecognizer sr;
    // 获取speechstate
    int getSpeechState();
    /**获取speech过程中，语音信号的值（用于显示声音波形图）
     * */
    float getSpeechValue();
    //获取识别结果
    QString getSpeechResult();
    //开始识别
    int startSpeech();
    //语音合成
    int compose(QString text);
    //语音播报
    int play(QString filePath);
};

#endif // SRINTERFACE_H
