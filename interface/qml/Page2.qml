import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.0

Page2Form {

    property string imagestr:"";
    property int ti_shi_time;

    Timer{
        id:countdown
        interval: 1000;
        repeat: true
        triggeredOnStart: true  //这一设置保证了立即触发，如果没有，你会发现有延迟
        onTriggered: {
            attr.counter -= 1;
            time_sec.text=attr.counter
            console.log("attr",attr.counter)
            if(attr.counter < 1){            //60秒倒计时
                countdown.stop()           //停止计时
                page1.visible = true;      //返回主界面
                page2.visible = false;
            }
            if((zhifubao.pay_code == ""))     //请求二维码图片
            {
                console.log("qq")
                console.log("22"+zhifubao.pay_code);
                imagestr = http.sendImage()  //获取图片名称
                if(imagestr != ""){
                    zhifubao.pay_code="http://123.160.246.110:8088/SMJ/images/"+imagestr;
                }
            }
            if((zhifubao.pay_code != ""))     //请求支付结果
            {
                console.log("aa")
                console.log("33"+zhifubao.pay_code);
                http.testGet2()
            }
        }
    }
    Connections{
        target: http;    //支付完成
        onSendZFB:{
            countdown.stop();   //计时结束
            zhifubao.pay_code = "";      //清除支付宝二维码
            weixin.pay_code = "";
            page2.visible = false;      //显示跳转界面
            page3.visible = true;
        }
    }
    Rectangle{   //选择数量框
        id:page2_3_z_2;
        width: page2_3_z.width;
        height: page2_3_z.height*0.8;
        y:page2_3_z.y+page2_3_z.height*0.2
       // color: "blue"

        Grid{
            anchors.fill: parent;
            anchors.margins: 3
            spacing: 4
            anchors.rightMargin: 16+parent.width*0.1;
            anchors.bottomMargin: 15;
            anchors.leftMargin: parent.width*0.1

            Repeater{
                model: 8;
                Rectangle{
                    width: parent.width/4;
                    height: parent.height/2
                    radius: 8;
                    //color: "#ffddb8"
                    color: "darkorange"
                    Text {
                        id: page2_3_z_text
                        text: index+1+"份"
                        color: "white"
                        anchors.centerIn: parent
                        font.pixelSize: parent.width*0.2
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onReleased: {
                            console.log("数量：",index+1)
                            if(food_dat.getfoodnum(attr.food_num) >= (index+1)){   //库存数量大于点击数量

                                page2_3.visible = true;     //支付方式界面显示
                                page2_3_z.visible = false;     //选择数量界面隐藏
                                page2_3_z_2.visible = false;   //选择数量框隐藏
                                page2_4_time.visible = true;    //倒计时框显示
                                http.testGet(1,attr.food_id,index+1);      //请求二维码
                                attr.counter = 60       //支付计时赋值
                                countdown.start();      //支付倒计时开始计时
                                //价格随数量变化而变化
                                page2_1_2_text7.text = food_dat.getfoodprice_code(attr.food_num)+(food_dat.getfoodprice(attr.food_num)*(index+1)).toFixed(2)
                            }
                            else{                     //库存不足时
                                ti_shi.visible = true;       //提示库存不足框显示
                                ti_shi_time = 2;               //2秒提示框消失
                                ti_shi_ti.start();             //开始倒计时
                                page2_3_z_2.visible = false     //数量选择框隐藏
                            }
                        }
                    }
                }
            }
        }
    }
    Timer{         //提示框倒计时
        id:ti_shi_ti
        interval: 1000;
        repeat: true
        triggeredOnStart: true  //这一设置保证了立即触发，如果没有，你会发现有延迟
        onTriggered: {
            ti_shi_time -=1    //每秒减一
            if(ti_shi_time < 1)
            {
                ti_shi.visible = false;     //提示框隐藏
                page2_3_z_2.visible = true;    //数量选择框显示
                ti_shi_ti.stop();         //停止计时
            }
            console.log("time=",ti_shi_time)
        }
    }
    Rectangle{       //提示数量不足对话框
        id:ti_shi
        width: page2_3_z.width*0.5;
        height: page2_3_z.height*0.8;
        y:page2_3_z.y+page2_3_z.height*0.2
        x:page2_3_z.width*0.25

        visible: false
        Text {
            id:ti_shi_text
            color: "red"
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.2
            text: "库存不足"
        }
        MouseArea{      //点击消失
            anchors.fill: parent
            onPressed: {
                ti_shi.visible = false      //提示数量不足消失
                page2_3_z_2.visible = true    //数量框显示
            }
        }
    }


    Rectangle{    //返回按键
        id:fan_hui
        x:page2_4.width*0.1
        y:parent.height*0.9
        width: page2_4.width*0.2
        height: page2_4.height*0.8
        radius: 4
        color: 'lightgray'
        Text {
            id: fan_hui_text
            anchors.centerIn: parent
            text: qsTr("<    取消    ")
            font.pixelSize: parent.height*0.6
        }
        MouseArea{
            anchors.fill: parent
            onContainsMouseChanged: fan_hui.state == 'clicked' ? fan_hui.state = "" : fan_hui.state = 'clicked';
            onReleased: {
                countdown.stop();   //计时结束
                zhifubao.pay_code = "";      //清除支付宝二维码
                weixin.pay_code = "";
                page1.visible = true;        //返回主界面
                page2.visible = false;

                page2_3.visible = false;     //支付方式界面隐藏
                page2_3_z.visible = true;       //选择数量界面显示
                page2_3_z_2.visible = true;     //选择数量框显示
                page2_4_time.visible = false;       //倒计时框隐藏
            }
        }
        states:[
            State {
                name: "clicked"
                PropertyChanges { target: fan_hui; color: "gray" }      //按下变色
            }
        ]
    }

    page2_1_1_image.source: food_dat.getfoodimage(attr.food_num);   //食品图片
    page2_1_2_text1.text: food_dat.getfoodname(attr.food_num);    // 食品名称
    page2_1_2_text3.text: food_dat.getfoodroad(attr.food_num);     //货道号
    page2_1_2_text5.text: food_dat.getfoodnum(attr.food_num);   //库存数量
    page2_1_2_text7.text:food_dat.getfoodprice_code(attr.food_num)+food_dat.getfoodprice(attr.food_num);    //食品价格
   // zhifubao.pay_code:"";    //支付宝二维码
   // weixin.pay_code: food_dat.getfoodwxcode(attr.food_num);         //微信二维码
}
