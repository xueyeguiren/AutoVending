/**
  * １用于初始化界面
  * ２用于控制其他部分显示
  *
  *
**/
#ifndef INTERFACECONTROL_H
#define INTERFACECONTROL_H

#include <QObject>
#include <QList>
class InterfaceControl : public QObject
{
    Q_OBJECT
public:
    explicit InterfaceControl(QObject *parent = 0);
//    int initMain();//初始化主界面
    //单独定义全局变量，在初始化时候去调用http模块的方法，然后存储在变量中，在初始化结束之后将变量删除
    // 需要有检查相邻的商品重复，只显示一个
    void testJson();
signals:

public slots:
//    //获取所有商品id
//    QList<int>  getGoodsId();
//    //根据商品id查询商品名称
//    QString getGoodsNameById(int goodsId);
//    //根据商品id查询商品库存
//    int getGoodsNameBylId(int goodsId);
//    //根据商品id查询商品价格
//    float getGoodsNameBylId(int goodsId);
};

#endif // INTERFACECONTROL_H
