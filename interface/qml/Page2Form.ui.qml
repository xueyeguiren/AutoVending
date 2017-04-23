import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0


Rectangle {
    width: 540;
    height: 620;
    color:'white'

    property alias attr: attr
    property alias time_sec: time_sec
    property alias page2_3_z: page2_3_z
    property alias page2_3: page2_3
    property alias page2_4: page2_4;
    property alias page2_4_time: page2_4_time;
    property alias page2_1_1_image: page2_1_1_image;        //食品图片
    property alias page2_1_2_text1: page2_1_2_text1     //食品名称
    property alias page2_1_2_text3: page2_1_2_text3     //货道号
    property alias page2_1_2_text5: page2_1_2_text5    //库存数量
    property alias page2_1_2_text7: page2_1_2_text7    //食品价格
    property alias zhifubao: zhifubao    //支付宝二维码
    property alias weixin: weixin    //微信二维码

    QtObject{
        id:attr
        property int counter;   //定义一个变量
        property int food_num;    //第几种食品
        property int  food_id;     //食品id
    }
    Connections{
        target: qsen;
        onSendFood:{
            attr.food_num = num;
            attr.food_id = food_dat.getfoodid(num);
            //初始化界面
            page2_3.visible = false;        //支付方式界面隐藏
            page2_3_z.visible = true;       //选择数量界面显示
            page2_3_z_2.visible = true;     //选择数量框显示
            page2_4_time.visible = false;   //倒计时框隐藏
            zhifubao.pay_code = "";      //清除支付宝二维码
            weixin.pay_code = "";        //清除微信二维码

            //默认价格为一份的价格
            page2_1_2_text7.text = food_dat.getfoodprice_code(attr.food_num)+(food_dat.getfoodprice(attr.food_num)*1).toFixed(2)
        }
    }
    Rectangle{      //最上方关于食品的框
        id:page2_1;
        width: parent.width;
        height: parent.height*0.4;

        Rectangle{       //食品图片框
            id:page2_1_1;
            width: parent.width*0.5;
            height: parent.height;
            Rectangle{  //最上方一条线
                width: parent.width
                y:0;
                color: "orange";
                height: 3;
            }
            Image {
                id: page2_1_1_image
                width: parent.width*0.8;
                height: parent.height*0.6;
                anchors.centerIn: parent;
              //  source: food_dat.getfoodimage(0);
            }
        }
        Rectangle{        //食品特性框
            id:page2_1_2;
            width: parent.width*0.5;
            height: parent.height;
            anchors.left: page2_1_1.right;
            Rectangle{  //最上方一条线
                width: parent.width
                y:0;
                color: "orange";
                height: 3;
            }
            Text {       //食品名
                id: page2_1_2_text1;
                font.pixelSize: parent.width*0.1;
                x:parent.width*0.1
                y:parent.height*0.2
                color: "red"
            //    text: qsTr("鸡肉饭");
            }
            Text {      //货道
                id: page2_1_2_text2;
                font.pixelSize:parent.width*0.07;
                x:parent.width*0.1;
                y:page2_1_2_text1.height+page2_1_2_text1.y;
                text: qsTr("货道:");
                renderType: Text.NativeRendering
            }
            Text {      //货道号
                id: page2_1_2_text3;
                font.pixelSize:parent.width*0.07 ;
                color: "red";
                x:page2_1_2_text2.width+page2_1_2_text2.x+3;
                y:page2_1_2_text1.height+page2_1_2_text1.y;
               // text: qsTr("004")
            }
            Text {      //库存
                id: page2_1_2_text4;
                font.pixelSize:parent.width*0.07;
                x:page2_1_2_text3.width+page2_1_2_text3.x+9;
                y:page2_1_2_text1.height+page2_1_2_text1.y;
                text: qsTr("库存:")
            }
            Text {       //库存数量
                id: page2_1_2_text5;
                font.pixelSize: parent.width*0.07;
                color: "red";
                x:page2_1_2_text4.width+page2_1_2_text4.x+3;
                y:page2_1_2_text1.height+page2_1_2_text1.y;
              //  text: qsTr("6")
            }
            Text {       //价格文字
                id: page2_1_2_text6;
                font.pixelSize:parent.width*0.07;
                x:parent.width*0.1
                y:page2_1_2_text2.y+page2_1_2_text2.height;
                text: qsTr("价格:")
            }
            Text {       //价格
                id: page2_1_2_text7;
                font.pixelSize: parent.width*0.07;
                color: "red";
                x:page2_1_2_text6.x+page2_1_2_text6.width;
                y:page2_1_2_text2.y+page2_1_2_text2.height;
             //   text: qsTr("￥10.00")
            }
        }
    }
    Rectangle{      //中间三斜杠
        id:page2_2;
        width: parent.width;
        height: parent.height*0.06;
        anchors.top:page2_1.bottom;
        Image {
            id: page2_2_image
            width: parent.width;
            height: parent.height;
            source: "qrc:/new/prefix1/a1_07.png"
        }
    }

    Rectangle{      //下方选择数量框
        id:page2_3_z
        width: parent.width;
        height: parent.height*0.44;
        anchors.top:page2_2.bottom;
       // visible: false
        Rectangle{     //支付方式选择文字
            id:page2_3_z_1;
            width: parent.width;
            height: parent.height*0.2;
            anchors.leftMargin: 20;
            Text{
                id: page2_3_z_1_text;
                x:10
                font.pixelSize: parent.height*0.7;
                text: qsTr("请选择数量:");
            }
        }
    }

    Rectangle{      //下方支付框
        id:page2_3;
        width: parent.width;
        height: parent.height*0.44;
        anchors.top:page2_2.bottom;
        visible: false;

        Rectangle{     //支付方式选择文字
            id:page2_3_1;
            width: parent.width;
            height: parent.height*0.2;
            anchors.leftMargin: 20;
            Text{
                id: page2_3_1_text;
                x:10
                font.pixelSize: parent.height*0.7;
                text: qsTr("请选择支付方式:");
            }
        }
        Rectangle{    //支付图标
            id:page2_3_2;
            width: parent.width;
            height: parent.height*0.8;
            anchors.top: page2_3_1.bottom;
          //  color: 'blue'

            RowLayout{
                id:pay_layout
                anchors.fill: parent
                width: parent.width
                height: parent.height
                spacing: parent.width*0.2

                anchors.leftMargin: parent.width*0.15
                anchors.rightMargin: parent.width*0.15


                Rectangle{
                    id:zhi_fu_bao
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/4
                    Layout.preferredHeight: parent.height
                    //Layout.minimumHeight: parent.heigh

                    Pay_method{
                        id:zhifubao
                        width: parent.width;
                        height: parent.height
                       // pay_code:"qrc:/new/prefix1/zhi_fu.png"
                        pay_text: qsTr("支付宝支付");
                    }
                }
                Rectangle{
                    id:wei_xin
                    Layout.fillWidth: true
                    Layout.preferredWidth:parent.width/4
                    Layout.preferredHeight: parent.height

                    Pay_method{
                        id:weixin
                        width: parent.width;
                        height: parent.height
                        //pay_code:"qrc:/new/prefix1/zhi_fu.png"
                        pay_text: qsTr("微信支付");
                    }
                }
            }
        }
    }
    Rectangle{      //最下方返回按钮框
        id:page2_4;
        width: parent.width;
        height: parent.height*0.1;
        anchors.top: page2_3.bottom;

        Rectangle{    //倒计时框
            id:page2_4_time
            visible: false;
            x:parent.width*0.8-parent.width*0.1;
            y:parent.height*0.1
            width:parent.width*0.2
            height: parent.height*0.8
            radius: 4
            color: 'lightgray'

            Text {
                id: time_sec   //红数字
                color: 'red'
                font.pixelSize:parent.height*0.6
                y:countshow.y
                x:countshow.x+countshow.width*0.6
            }
            Text {       //数子显示设置
                id: countshow
                anchors.centerIn: parent
                font.pixelSize:parent.height*0.6
                text: "请支付    秒"
            }
        }
    }
}
