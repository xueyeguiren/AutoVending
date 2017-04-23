#include "food_date.h"

food_date::food_date(QObject *parent) : QObject(parent)
{
    connect_date();
    date_recv();
   // yuyin_date("宽面");
}
bool food_date::connect_date()
{
    //加载驱动
    QPluginLoader loader;
    // MySQL 驱动插件的路径
    loader.setFileName("/home/wanghui/Qt5.7.1/5.7/gcc_64/plugins/sqldrivers/libqsqlmysql.so");
    //qDebug() << "loader.load()..............."<<loader.load();
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setDatabaseName("AutoFoodMachine");
    db.setHostName("192.168.30.37");
    db.setPort(3306);
    db.setUserName("root");
    db.setPassword("123456");
    if(!db.open()){
        qDebug() << "无法建立数据库连接";
        return false;
    }
    else{
        qDebug() <<"sucess";

    }
    return true;
}


void food_date::date_recv()    //把数据库中的值赋值给food_all数组
{
    QSqlQuery query;
    int i =0;
    int j = 0;

    for(j=0;j<food_max;j++)      //初始化
    {
        food_all[i].food_backimage = " ";
        food_all[i].food_name = " ";
        food_all[i].food_num = " ";
        food_all[i].food_image = " ";
        food_all[i].food_price = " ";
        food_all[i].food_price_code = " ";
        food_all[i].food_price_text = " ";
      //  food_all[i].food_code = " ";
      //  food_all[i].food_count =0;

    }
    query.exec("select *from Food");
    total_num = query.size();    //一共几种食品
    for(i=0;i<food_max ;i++)
    {
        if(query.seek(i))
        {
            food_all[i].food_backimage = query.value("food_backimage").toString();
            food_all[i].food_image = query.value("foodimage_url").toString();
            food_all[i].food_name = query.value("food_name").toString();
            food_all[i].food_num = query.value("food_number").toString();
            food_all[i].food_id = query.value("food_id").toString();
            food_all[i].food_price = query.value("food_price").toString();
            food_all[i].food_price_text = query.value("food_price_text").toString();
            food_all[i].food_price_code = query.value("food_price_code").toString();

            food_all[i].food_road = query.value("food_road").toString();
            food_all[i].food_num = query.value("food_number").toString();
            food_all[i].food_zfbcode = query.value("foodzfb_code").toString();
            food_all[i].food_wxcode = query.value("foodwx_code").toString();

        }
    }
    //getfood_num("牛肉面");
}
int food_date::getfood_num(QString str)    //查看食品在数据库中排第几
{
    int i;
    for(i = 0; i < total_num; i++)
    {
        if(food_all[i].food_name == str)
            break;
    }
    qDebug()<<"i===="<<i;
    return i;
}

int food_date::getfood_totalnum()   //获取食品总共几行
{
    int num = 0;

    if(total_num % 4){
        num = total_num/4 + 1;
    }
    else {
        num = total_num/4;
    }
   // qDebug()<<"hang  num" <<num;
    return num;    //返回行数   用于竖直显示
}

//初始化的基本属性
QString food_date::getbackimage(int i)   //背景图片
{
  //  qDebug()<<"food_backimage= "<<i<<food_all[i].food_backimage;
    return food_all[i].food_backimage;
}
QString food_date::getfoodimage(int i)    //食品图片
{
   // qDebug()<<"food_image= "<<i<<food_all[i].food_image;
    return food_all[i].food_image;
}
QString food_date::getfoodname(int i)     //食品名称
{
  //  qDebug()<<"food_name= "<<i<<food_all[i].food_name;
    return food_all[i].food_name;
}
QString food_date::getfoodprice_text(int i)   //获得 “单价：”
{
   // qDebug()<<"food_price_text= "<<i<<food_all[i].food_price_text;
    return food_all[i].food_price_text;
}
QString food_date::getfoodprice_code(int i)   //获得 “￥”
{
   // qDebug()<<"food_price_code= "<<i<<food_all[i].food_price_code;
    return food_all[i].food_price_code;
}
QString food_date::getfoodprice(int i)    //食品价格
{
  //  qDebug()<<"food_price= "<<i<<food_all[i].food_price;
    return food_all[i].food_price;
}

//跳转后的属性
QString food_date::getfoodid(int i)     //获得库存
{
   // qDebug()<<"food_num= "<<i<<food_all[i].food_num;
    return food_all[i].food_id;
}
QString food_date::getfoodroad(int i)     //获得货道
{
   // qDebug()<<"food_road= "<<i<<food_all[i].food_road;
    return food_all[i].food_road;
}
QString food_date::getfoodnum(int i)     //获得库存
{
   // qDebug()<<"food_num= "<<i<<food_all[i].food_num;
    return food_all[i].food_num;
}
QString food_date::getfoodzfbcode(int i)     //获得支付宝二维码
{
  //  qDebug()<<"food_zfb= "<<i<<food_all[i].food_zfbcode;
    return food_all[i].food_zfbcode;
}
QString food_date::getfoodwxcode(int i)     //获得微信二维码
{
   // qDebug()<<"food_wx= "<<i<<food_all[i].food_wxcode;
    return food_all[i].food_wxcode;
}

