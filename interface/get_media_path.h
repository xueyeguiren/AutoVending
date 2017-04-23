#ifndef GET_MEDIA_PATH_H
#define GET_MEDIA_PATH_H

#include <QObject>
#include <QDir>
#include <QDebug>

class get_media_path : public QObject
{
    Q_OBJECT
public:
    explicit get_media_path(QObject *parent = 0);


   // QString path;
   // QDir *dir;
   // QStringList filter;
   // QList<QFileInfo> *fileinfo;

signals:

public slots:
    QString media_path(int num);
    int media_count();
};

#endif // GET_MEDIA_PATH_H
