#include "get_media_path.h"

get_media_path::get_media_path(QObject *parent) : QObject(parent)
{

}
int get_media_path::media_count()
{

    QStringList filter;
    QString path = "/home/wanghui/void/";
    QDir *dir = new QDir(path);
    QList<QFileInfo> *fileinfo = new QList<QFileInfo>(dir->entryInfoList(filter));
  //  qDebug()<<"cout = "<<fileinfo->count();
    return fileinfo->count();
}

QString get_media_path::media_path(int num)
{
    QStringList filter;
    QString path = "/home/wanghui/void/";
    QDir *dir = new QDir(path);
    QList<QFileInfo> *fileinfo = new QList<QFileInfo>(dir->entryInfoList(filter));
    //qDebug()<<"NUM++"<<num<<"cccc"<<fileinfo->count();
   // qDebug()<<"path ="<<fileinfo->at(num).filePath();
    return fileinfo->at(num).filePath();
}
