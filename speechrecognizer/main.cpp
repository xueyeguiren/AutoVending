#include <QGuiApplication>
#include <QtQml>
//#include <QQmlApplicationEngine>
#include <QCoreApplication>
#include <srinterface.h>
#include <QDebug>
#include <audiocontrol.h>

const char* login_params= "appid = 56ee43d0, work_dir = .";
char* stt_session_begin_params=
   "sub = iat, domain = iat, language = zh_cn, "
   "accent = mandarin, sample_rate = 16000, "
   "result_type = plain, result_encoding = utf8";
const char* tts_session_begin_params =
        "voice_name = xiaoyan, text_encoding = utf8, sample_rate = 16000, "
        "speed = 50, volume = 50, pitch = 50, rdn = 2";
int main(int argc, char *argv[])
{
//    qDebug()<<"test"<<test123;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
//    qmlRegisterType<AudioLevels>("com.bodawb.AudioLevels",1,0,"AudioLevels");
    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
//    engine.addImageProvider("wavePic",new AudioLevels);

    /**
     * 为了在c++调用qml，可以实现在类内来调用
     *步骤如下:
     * 1.在一个类Global，声明和定义一个静态变量用来装载rootitem
     * 2.main方法内调用global下的setRooItem
     * 3.其他类内调用global的getRootItem即可
     **/

//    QList<QObject *> rootItems= engine.rootObjects();
//    QObject *rootItem=rootItems.at(0);
//    Global gl;
//    gl.setRootItem(rootItem);
//    qDebug()<<rootItem->objectName();
//    AudioControl al;
//    int ret=al.startRecord(login_params,stt_session_begin_params);
    SRInterface sr;
    int ret=sr.play("/home/pi/wav/meitingdong.wav");
    qDebug()<<"ret"<<ret;
    return app.exec();
}
