#include "qsend.h"

Qsend::Qsend(QObject *parent) : QObject(parent)
{

}
void Qsend::send_foodid_signal(int num)  //食品特性获得
{
    emit this->sendFood(num);
  //  qDebug()<<"aswq";
}
void Qsend::send_key_signal()    //qml键盘初始化
{
    emit this->sendkey();
}
