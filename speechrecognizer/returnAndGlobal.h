#ifndef RETURNVALUE_H
#define RETURNVALUE_H
#define REC_FAIL_FORMATNOTSUPPORT -1;//格式不支持
#define REC_FAIL_INPUTDEVICEPARAMETER -2;//inputdevice部分参数有问题，如channel's count
#define REC_FAIL_HAVENODEFAULTINPUTDEVICE -3;//没有默认的inputdevice的
#define REC_FAIL_STARTRECORD -4;
#define REC_FAIL_STARTSESSION -5;
#define REC_SUCCESS_CONFIGURERECORD 0;//配置record成功
#define REC_SUCCESS_STARTRECORD 0;//打开record成功
#define STARTSESSION_SUCCESS 0;
#define STARTSPEECH_SUCCESS 0;
#define STARTSPEECH_FAIL -6;
#define DOSPEECH_FAIL -7;
#define DOSPEECH_SUCCESS 0;
#define STARTSPEECH_CONTINUE 1;
#define COMPOSE_FAIL -8;
#define COMPOSE_SUCCESS 0;

#define STARTPLAYER_FILE_FAIL -9;
#define STARTPLAYER_FORMATNOTSUPPORT -10;
#define STARTPLAYER_SUCCESS 0;

#define GETSTRUCTREC_FAIL -11;
#define GETSTRUCTREC_SUCCESS 0;
#define GETSPEECHSTATE_FAIL -12;
#define GETSPEECHSTATE_SUCCESS 0;

#define PLAY_FAIL -13;
#define PLAY_SUCCESS 0;
#include <QAudioInput>
struct speech_rec{
    const char* session_id;//session_id
    char* data;// 录音传过来的数据
    int length;//传过来数据的长度
    int ep_stat;//endPointer
    int rec_stat;//录音机状态
    int audio_status;//音频状态

    bool start;       //是否开始录音
    float value;        //处理过用于显示的值

    bool isGetSpeechResult;//是否得到识别的结果
    char* result;//得到的识别结果

    QAudioInput* audioinput;//audioinput 指针
};

/* wav音频头部格式 */
typedef struct _wave_pcm_hdr
{
    char            riff[4];                // = "RIFF"
    int		size_8;                 // = FileSize - 8
    char            wave[4];                // = "WAVE"
    char            fmt[4];                 // = "fmt "
    int		fmt_size;		// = 下一个结构体的大小 : 16

    short int       format_tag;             // = PCM : 1
    short int       channels;               // = 通道数 : 1
    int		samples_per_sec;        // = 采样率 : 8000 | 6000 | 11025 | 16000
    int		avg_bytes_per_sec;      // = 每秒字节数 : samples_per_sec * bits_per_sample / 8
    short int       block_align;            // = 每采样点字节数 : wBitsPerSample / 8
    short int       bits_per_sample;        // = 量化比特数: 8 | 16

    char            data[4];                // = "data";
    int		data_size;              // = 纯数据长度 : FileSize - 44
} wave_pcm_hdr;

#endif // RETURNVALUE_H
