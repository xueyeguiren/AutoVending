#ifndef FOOD_DATE_H
#define FOOD_DATE_H

#include <QObject>
#include <QtSql/QSqlDriverPlugin>
#include <QtSql/QSqlDriver>
#include <QPluginLoader>
#include <QtSql/QSqlDatabase>
#include <QSqlQuery>
#include <QtDebug>
#include <string>

typedef struct food
{
    QString food_backimage;     //背景图片
    QString food_image;         //食品图片
    QString food_name;          //食品名称
    QString food_id;            //食品id
    QString food_price_text;    //获得“单价”
    QString food_price_code;    //获得“￥”
    QString food_price;         //食品价格
    QString food_road;          //食品货道
    QString food_num;           //食品库存
    QString food_zfbcode;       //支付宝二维码
    QString food_wxcode;        //微信二维码
}food_proper;

#define food_max 36

class food_date : public QObject
{
    Q_OBJECT
public:
    explicit food_date(QObject *parent = 0);

    int total_num;         //数据库中一共有多少种食品

    bool connect_date();

    void date_recv();

    food_proper food_all[food_max];

signals:

public slots:
    int getfood_totalnum();
    int getfood_num(QString str);

    QString getbackimage(int i);
    QString getfoodimage(int i);
    QString getfoodname(int i);
    QString getfoodprice_text(int i);
    QString getfoodprice_code(int i);
    QString getfoodprice(int i);

    QString getfoodroad(int i);
    QString getfoodnum(int i);
    QString getfoodid(int i);
    QString getfoodzfbcode(int i);
    QString getfoodwxcode(int i);
};

#endif // FOOD_DATE_H
