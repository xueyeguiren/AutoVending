#ifndef QSEND_H
#define QSEND_H

#include <QObject>
#include <QDebug>

class Qsend : public QObject
{
    Q_OBJECT
public:
    explicit Qsend(QObject *parent = 0);

signals:
    void sendFood(int num);
    void sendkey();

public slots:
    void send_foodid_signal(int num);
    void send_key_signal();

};

#endif // QSEND_H
