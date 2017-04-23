#ifndef HTTP_H
#define HTTP_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>
#include <QTimer>
#include <QFile>
#include <QUrl>
#include <QTextCodec>
#include <QNetworkReply>

class http : public QObject
{
    Q_OBJECT
public:
    explicit http(QObject *parent = 0);

  //  QNetworkReply *reply;
   // QUrl url;   //存储网络地址
   // QTimer *timer;  //倒计时的设置
    QString imageStr;
    QString chargeStr;

signals:
    void sendZFB();
    //void sendZfbImage(QString &iii);

public slots:
    void replyFinished(QNetworkReply *reply);
    void testGet(int machine_id,int food_id,int food_count);
    void testGet2();
    QString sendImage();

};

#endif // HTTP_H
