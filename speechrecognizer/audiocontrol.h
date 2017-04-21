#ifndef AUDIOCONTROL_H
#define AUDIOCONTROL_H
#include <QObject>
#include <QtCore/QIODevice>
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <speechrecognizer.h>

class AudioControl: public QIODevice
{
    Q_OBJECT
public:
/**定义方法**/
    explicit AudioControl(QObject* parent= 0);
    //开始session
    int startSession(const char* login_params,const char* stt_session_begin_params);
    //用来装着m_device,m_audioInput，结束时候用
    static struct audioInput_struct as;
    //配置音频
    int configureRecord(QAudioDeviceInfo inputDevice);
    QAudioFormat getDefaultFormat(QAudioDeviceInfo inputDevice);
    //打开声卡capture
    int startRecord(const char* login_params,const char* stt_session_begin_params);
    //关闭声卡capture
    void suspendRecord();
    //开始识别
    int startSpeech(char*data,qint64 maxSize);
    //获取语音采样的数据
    struct speech_rec getStructRec();
/**定义变量**/
    QAudioInput* audioInput;//audioinput对象
    SpeechRecognizer sr;//sr对象
    struct speech_rec rec;//struct对象
protected:
    qint64 readData(char *data, qint64 maxSize);
    qint64 writeData(const char *data, qint64 maxSize);


};

#endif // AUDIOCONTROL_H