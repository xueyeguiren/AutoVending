#include "srinterface.h"

SRInterface::SRInterface()
{

}
struct Global:: QueryResult  SRInterface:: handleSpeech(char* result)
{
   int err;
   struct Global::QueryResult qr;

   QString str(result);//char＊转QString１
   str=str.simplified();//char＊转QString２
   if(!(str.length()))//未识别
       qr.mode=0;
   else
   {
       err=queryGoods(&qr,str);//如果不为空的话就进行本机数据库查询
       if(err==0)
           qr.mode=1;//是商品类型
       else
       {
           err=queryServer(&qr,str);
           if(err==0)
           {
               qr.returnChar="我是服务器返回回来的内容";
               qr.mode=2;//是对话类型
           }
           else
               qr.mode=3;//不明白
       }
   }
   return qr;
}

int SRInterface::queryGoods(struct Global::QueryResult* qr, QString string)
{
        int goodsId;
        ProcessMysql pm;
        Goods_general* gg;
        Goods_machining* gm;
        goodsId=pm.querySpeechResult(string);//获取goodsid
        if(goodsId>0)
        {
            qr->googsId=goodsId;
            //根据goodsid查询商品名称
            gg=pm.queryGoods_general(goodsId);
            gm=pm.queryGoods_machining(goodsId);

            qr->returnChar=gg->getName();
            qDebug()<<"商品名称"<<qr->returnChar;
            qr->store=gm->getStore();
            int num=pm.querySpeechNum(string);
            if(num>0)
                qr->goodsNum=num;
            else
                qr->goodsNum=1;
            return 0;
        }
        return -1;

}
int SRInterface::queryServer(struct Global::QueryResult* qr, QString string)
{
    return 0;
}

void SRInterface:: SpeechStart(char* result)
{
    struct Global::QueryResult qr;
    AudioPlayer sp;
    SpeechSynthesis ss;
    QString str;//待转化QSTRING字符串
    QByteArray ba;//过渡
    char* mm;//待转化char*字符串

//    char* speakerPath;//播放路径
    QString num;//库存数量
    QString speakerPath;
    QString suffix;//后缀.wav
    //根据文字内容来判断是什么对话
    SRInterface sf;
    qr=sf.handleSpeech(result);
    printf("qr-mode-->%d\n",qr.mode);
    switch (qr.mode) {
    //首先广告位置界面显示识别内容
    case 0:
        //显示及播放“我一个字都没听懂”
        sp.startPlayer("/home/pi/wav/meitingdong.wav");
        break;
    case 1:
        //说明本机数据库有此商品
        if(qr.goodsNum>qr.store)//库存不够
        {
            //显示及播放库存不足，目前剩余qr.store件
            speakerPath="/home/pi/wav/kucunbuzu/";
            suffix=".wav";
            num=QString::number(qr.store,10);
            speakerPath+=num+suffix;

//            QByteArray ba = speakerPath.toUtf8();
//            char *mm = ba.data();
            sp.startPlayer(speakerPath);
        }
        else
            //调转至支付界面,显示及播放请付款
            sp.startPlayer("/home/pi/wav/fukuan.wav");
         //结束２s后界面调转至广告界面
        break;
     case 2:
        str=qr.returnChar;
        ba = str.toUtf8();
        mm = ba.data();
        //显示及播放从后台传来的数据
//        ss.StartCompose(mm);
        sp.startPlayer("/home/pi/wav/server.wav");
        break;
    case 3:
        //显示及播放“sorry,我不明白你在说什么呢”
        sp.startPlayer("/home/pi/wav/bumingbai.wav");
        break;
    default:
        break;
    }
}

// 获取speechstate,只有speechstate为stop表示识别完成
int SRInterface:: getSpeechState()
{
    if(sr.isGetValue)
        speechState=stop;
    else if(m_device.getAudioData()->start)
        speechState=speeching;
    return this->speechState;
}

/**获取speech过程中，语音信号的值（用于显示声音波形图）
 * valueNum--返回的信号值的数量（即波形图分辨率）
 * */
float SRInterface::getSpeechValue()
{

    return m_device.getAudioData()->value;
}

//获取识别结果
QString SRInterface::getSpeechResult()
{
    return sr.result;
}

//开始识别
int SRInterface::startSpeech()
{
    as.startRecord();
    speechState=ready;
}

//语音合成
int SRInterface::compose(QString text)
{

}

//语音播报
int SRInterface::play(QString filePath)
{

}
