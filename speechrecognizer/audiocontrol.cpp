#include "audiocontrol.h"
#include <unistd.h>
#include <QtMath>
#include <QAudio>
#include <QDebug>
#include <returnAndGlobal.h>
AudioControl::AudioControl( QObject *parent)
    :  QIODevice(parent)
{

}

static const int resolution =50;//分辨率滚动快慢
int AudioControl::startRecord(const char* login_params,const char* stt_session_begin_params)
{
    int ret;
    QAudioDeviceInfo inputDevice = QAudioDeviceInfo::defaultInputDevice();
//    QList<QAudioDeviceInfo> qq=QAudioDeviceInfo:: availableDevices(QAudio::AudioInput);
//    inputDevice=qq.at(13);
    if(inputDevice.deviceName().length()<0||inputDevice.deviceName()==NULL)
    {
        return REC_FAIL_HAVENODEFAULTINPUTDEVICE;//没有可用的默认device
    }

    ret=configureRecord(inputDevice);
    if(ret<0)//inputdevice 没有合适的硬件
    {
        return REC_FAIL_STARTRECORD;
    }
    ret=startSession(login_params,stt_session_begin_params);//在此开始新对话
    if(ret<0)
    {
        return REC_FAIL_STARTSESSION;//开始session失败
    }
    return REC_SUCCESS_STARTRECORD;
}

void AudioControl::suspendRecord()
{
    this->close();
    if(audioInput)
    audioInput->suspend();
    delete audioInput;
    audioInput=NULL;
    sr.stopSession(rec.session_id);
}

int AudioControl::startSession(const char* login_params,const char* stt_session_begin_params)
{
    int ret;
    rec.ep_stat = MSP_EP_LOOKING_FOR_SPEECH;
    rec.rec_stat = MSP_REC_STATUS_SUCCESS;
    rec.audio_status = MSP_AUDIO_SAMPLE_FIRST;

    char* session_id;//根据返回值判断运行情况
    /******************************************会话on*/
    ret=sr.startSession(login_params,stt_session_begin_params,&session_id);
    if(ret<0)
    {
        qDebug()<<"startSessionFail,错误代码"<<ret;
        return ret;
    }
    qDebug()<<"session_id"<<session_id;
    rec.session_id=session_id;
    return STARTSESSION_SUCCESS;
     /******************************************会话off*/
}

int AudioControl::configureRecord(QAudioDeviceInfo inputDevice)
{
//    AudioDevice* audioDevice = new AudioDevice;//继承了iodevice的类，读写硬件数据
    QAudioFormat formatAudio;//audio参数设置
    if (inputDevice.supportedSampleRates().size() > 0
            && inputDevice.supportedChannelCounts().size() > 0
            && inputDevice.supportedSampleSizes().size() > 0
            && inputDevice.supportedCodecs().size() > 0) {

        formatAudio= getDefaultFormat(inputDevice);
        if(!(inputDevice.isFormatSupported(formatAudio)))
        {
            qDebug()<<"没有找到合适的录音格式！";
            return REC_FAIL_FORMATNOTSUPPORT;//没有找到合适的录音格式
        }
        audioInput = new QAudioInput(inputDevice, formatAudio, this);
        audioInput->setBufferSize(40000);
        this->open(QIODevice::WriteOnly);
        audioInput->start(this);
        return REC_SUCCESS_CONFIGURERECORD;

    } else {
        // channelcount或者其他参数有问题
        qDebug()<<"没有合适的inputdevice！";
        return REC_FAIL_INPUTDEVICEPARAMETER;

    }
}
QAudioFormat AudioControl::getDefaultFormat(QAudioDeviceInfo inputDevice)
{
    QAudioFormat formatAudio;
    formatAudio.setSampleRate(16000);
    formatAudio.setChannelCount(inputDevice.supportedChannelCounts().at(0));
    qDebug()<<"codec"<<inputDevice.supportedSampleSizes().at(1);//16
    formatAudio.setSampleSize(inputDevice.supportedSampleSizes().at(1));
    qDebug()<<"codec"<<inputDevice.supportedCodecs().at(0);
    formatAudio.setCodec(inputDevice.supportedCodecs().at(0));
    formatAudio.setByteOrder(QAudioFormat::LittleEndian);
    formatAudio.setSampleType(QAudioFormat::SignedInt);
    return formatAudio;
}
qint64 AudioControl::readData(char *data, qint64 maxSize)
{
    Q_UNUSED(data)
    Q_UNUSED(maxSize)
    return -1;
}

//! [2]
qint64 AudioControl::writeData(const char *data, qint64 maxSize)
{
    long sum=0;
    long result=0;
    float value;
    int newDataSize = maxSize / resolution;
    int i;
    short audioData;
    // If we get more data than array size, we need to adjust the start index for new data.
    // Move the old data ahead in the rows (only do first half of rows + middle one now).
    for(i=0;i<newDataSize;i++){
        audioData=(((data[i*resolution+1])<<8)|(data[i*resolution]&0xFF));
//        QTime current_time = QTime::currentTime();
//        int msec = current_time.msec();
//        qDebug()<<i<<audioData[i];
          sum+=audioData*audioData;
    }
   if(newDataSize==0)
       newDataSize=1;
   result=qSqrt(sum/newDataSize);
   if(result>32767)
       result=0;
      qDebug()<<"k"<<"------------"<<result;
       value = float(result)/109.1f;
       if(value<0)
           value=(value-0.1f);
       else
           value=(value+1.1f);
    rec.value=value;
    rec.start=true;
    int ret;
    ret=startSpeech((char*)data,maxSize);
    return maxSize;
}
//! [2]

struct speech_rec AudioControl:: getStructRec()
{
    return rec;
}
int AudioControl::startSpeech(char*data,qint64 maxSize)
{
    int ret;
    qDebug()<<"startSpeech";
    rec.data=data;
    rec.length=maxSize;
    bool isGetResult;
    char* result;
    ret=sr.startSpeechRecognizer(&rec,&isGetResult,&result);
    if(ret<0)
    {
        qDebug()<<"识别错误，错误代码"<<ret;
        return  STARTSPEECH_FAIL;//识别有错误发生
    }
    if(isGetResult)
    {
        //获取到结果了
        rec.isGetSpeechResult=true;
        rec.result=result;
        suspendRecord();
        return STARTSPEECH_SUCCESS;//得到识别结果
    }
    rec.audio_status = MSP_AUDIO_SAMPLE_CONTINUE;//未得到识别结果
    return STARTSPEECH_CONTINUE;
}
