#include "http.h"
#include <QDebug>
http::http(QObject *parent) : QObject(parent)
{
    imageStr = "";
    chargeStr = "";
}

void http::replyFinished(QNetworkReply *reply)
{
    QString all = reply->readAll();
    qDebug()<<"massr1...."<<all;
    if(all == "1"){       //支付成功
        qDebug()<<"..............................."<<all;
      //  this->timer->stop();
        imageStr = "";
        emit this->sendZFB();
    }
    if(all.contains("/"))
    {
        QStringList list1=all.split("/");
        imageStr = list1.at(0);            //图片
        qDebug()<<"list0..."<<imageStr;
        chargeStr = list1.at(1);          //货单号
        qDebug()<<"list1...."<<chargeStr;
    }
    reply->deleteLater();   //最后释放reply 对象
}
QString http::sendImage()
{
    qDebug()<<"iamge1234...."<<imageStr;
    return imageStr;
}

void http::testGet(int machine_id,int food_id,int food_count )    //发送请求  请求生成二维码
{
    QUrl url;   //存储网络地址
    QString url_str;
    QNetworkAccessManager *manager;

    imageStr = "";

    manager = new QNetworkAccessManager(this);//新建QNetworkAccessManager对象
    connect(manager,SIGNAL(finished(QNetworkReply*)),
            this,SLOT(replyFinished(QNetworkReply*)));//关联信号和槽
    url_str = QString("http://123.160.246.110:8088/SMJ/test1?machine_id=%1&food_id=%2&food_count=%3").arg(machine_id).arg(food_id).arg(food_count);
    qDebug()<<"url="<<url_str;
    url = url_str;

    qDebug()<<"333333333";
    manager->get(QNetworkRequest(QUrl(url)));
}
void http::testGet2()     //发送请求 请求支付结果
{
    QUrl url;   //存储网络地址
    QNetworkAccessManager *manager;
    manager = new QNetworkAccessManager(this);//新建QNetworkAccessManager对象
    connect(manager,SIGNAL(finished(QNetworkReply*)),
            this,SLOT(replyFinished(QNetworkReply*)));//关联信号和槽
    qDebug()<<"aaaaaaa";
    url = "http://123.160.246.110:8088/SMJ/ceshi?str="+chargeStr;
    manager->get(QNetworkRequest(QUrl(url)));
}
