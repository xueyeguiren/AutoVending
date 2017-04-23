import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import QtMultimedia 5.5

import cn.qSend 1.0
import cn.food_date 1.0
import cn.get_media_path 1.0
import cn.http 1.0

ApplicationWindow {
    visible: true
    width: 540
    height: 960
    title: qsTr("Hello ww ")

    property alias page1: page1;
    property alias page2: page2;
    property alias page3: page3;
    property alias page4: page4;
    property alias page5: page5;
    property alias page6: page6;
    property alias page7: page7;
    property alias mediaplay: mediaplay

    property int  medianum:2;   //初始化为2  除了.和..
    property string media_path;      //视频路径
    property string yu_yin_name:""    //语音输入食品名字

    Qsend{
        id:qsen;
    }
    Food_date{
        id:food_dat;
    }
    Get_media_path{
        id:get_path;
    }
    Http{
        id:http;
    }

    QtObject{
        id:att
        property int count;   //定义一个变量
        property int  path_num;      //文件夹下的视频总数
    }
    Timer{
        id:countdown
        interval: 100;
        repeat: true
        triggeredOnStart: true  //这一设置保证了立即触发，如果没有，你会发现有延迟
        onTriggered: {
            //  att.count -= 1;
            //console.log("att=",att.count)
            //单个视频播放
            //多个视频播放
            if(miantop1.currentTime(mediaplay.position) === miantop1.currentTime(mediaplay.duration)){
                miantop1.nextMeida();    //调用函数
                mediaplay.seek(0);    //视频位置指向开头  一个视频时循环播放
                mediaplay.play();       //视频播放
            }
        }
    }
    Rectangle{       //最上视频播放
        id:miantop1;
        width: parent.width;
        height: parent.height*0.4;
     //   visible: false;

        function  nextMeida()      //循环播放
        {
            att.path_num = get_path.media_count();       //得到文件夹下的文件数量
            if((currentTime(mediaplay.position)>1)&&(currentTime(mediaplay.position) == ((currentTime(mediaplay.duration))))){
                medianum++;
                if(medianum == att.path_num){
                    medianum = 2;
                }
            }
            media_path = "file:"+get_path.media_path(medianum) //获得视频路径
            mediaplay.source = media_path;      // 把视频路径传给视频播放器
           // att.count = currentTime(mediaplay.duration);
            countdown.start();     //开始计时
        }
        function currentTime(time)      //时间格式化
        {
            var sec = Math.floor(time/1000);    //视频一共多少秒
            return sec;
        }

        MediaPlayer{      //视频
            id:mediaplay
            source:miantop1.nextMeida()
            autoPlay: true;       //自动播放
        }
        VideoOutput{           //输出
            anchors.fill: parent
            source: mediaplay
        } 
  
        Button{
            id:ase
            text:miantop1.currentTime(mediaplay.position)
        }
    }

    Rectangle{    //最上语音界面
        id:maintop2;
        width: parent.width;
        height: parent.height*0.4;
        visible: false;
        Image {        //背景图片
            id: maintop2_image
            anchors.fill: parent
            source: "file:/home/wanghui/tupian/yu.jpg"
            //source: "qrc:/yu_yin/yu_bg.jpg"
        }
        Rectangle{     //最上云的框
            id:maintop2_yun
            width: parent.width
            height: parent.height*0.15
            y:5
          //  opacity:0     //透明度
          //  color: "red"
            color:Qt.rgba(1,1,1,0);

            Image {
                id: maintop2_yun1
                //anchors.fill: parent
                width: parent.width*0.2*0.7
                height: parent.height*0.7
                y:parent.height - maintop2_yun1.height
                source: "qrc:/yu_yin/yun2.png"
                SequentialAnimation on x{
                    loops: Animation.Infinite
                    NumberAnimation { to:30;easing.type: Easing.OutQuad; duration:3500 }
                   // PauseAnimation { duration: 1000 }
                    NumberAnimation { to: 0; easing.type: Easing.OutQuad; duration:3400}
                }
            }
            Image {
                id: maintop2_yun2
                //anchors.fill: parent
                width: parent.width*0.2*0.5
                height: parent.height*0.5
                x:130
                source: "qrc:/yu_yin/yun1.png"
                SequentialAnimation on x{
                    loops: Animation.Infinite
                    NumberAnimation { to:150;easing.type: Easing.OutQuad; duration:2400 }
                   // PauseAnimation { duration: 1000 }
                    NumberAnimation { to:130; easing.type: Easing.OutQuad; duration:2600}
                }
            }
            Image {
                id: maintop2_yun3
                //anchors.fill: parent
                width: parent.width*0.2*0.7
                height: parent.height*0.7
                x:220
                y:parent.height - maintop2_yun3.height
                source: "qrc:/yu_yin/yun1.png"
                SequentialAnimation on x{
                    loops: Animation.Infinite
                    NumberAnimation { to:250;easing.type: Easing.OutQuad; duration:3400 }
                   // PauseAnimation { duration: 1000 }
                    NumberAnimation { to: 220; easing.type: Easing.OutQuad; duration:3600}
                }
            }
            Image {
                id: maintop2_yun4
                //anchors.fill: parent
                width: parent.width*0.2*0.5
                height: parent.height*0.5
                x:330;
                source: "qrc:/yu_yin/yun1.png"
                SequentialAnimation on x{
                    loops: Animation.Infinite
                    NumberAnimation { to:350;easing.type: Easing.OutQuad; duration:2700 }
                   // PauseAnimation { duration: 1000 }
                    NumberAnimation { to: 330; easing.type: Easing.OutQuad; duration:2600}
                }
            }
            Image {
                id: maintop2_yun5
                //anchors.fill: parent
                width: parent.width*0.2*0.7
                height: parent.height*0.7
                x:450
                y:parent.height - maintop2_yun5.height
                source: "qrc:/yu_yin/yun2.png"
                SequentialAnimation on x{
                    loops: Animation.Infinite
                    NumberAnimation { to:470;easing.type: Easing.OutQuad; duration:3700 }
                   // PauseAnimation { duration: 1000 }
                    NumberAnimation { to: 450; easing.type: Easing.OutQuad; duration:3500}
                }
            }

        }

        Rectangle{     //中间识别框
            id:maintop2_midd
            width:parent.width
            height:  parent.height*0.6
            y:parent.height*0.3
            color:Qt.rgba(1,1,1,0);
          //  color: "red"
            Rectangle{
                id:maintop2_midd_zheng
                anchors.fill: parent
                color:Qt.rgba(1,1,1,0);

                Rectangle{    //图标框
                    id:icon
                    width: parent.height*0.5
                    height: parent.height*0.5
                    x:parent.width*0.4
                    color:Qt.rgba(1,1,1,0);
                //    color: "yellow"
                    Image {
                        id:image
                        anchors.fill: parent
                        source: "qrc:/yu_yin/sbz_03.png"
                        RotationAnimation on rotation {
                            from:0
                            to:360
                            duration:1000
                            loops: Animation.Infinite
                        }
                    }
                }
                Yu_yin{
                    txt:"正在识别,请稍候"
                }
            }

            Rectangle{
                id:maintop2_midd_cheng
                anchors.fill: parent
                color:Qt.rgba(1,1,1,0);
                visible: false
                Yu_yin{
                    sour:"qrc:/yu_yin/yu_cg.png"
                    txt:"牛肉面"
                }
            }

            Rectangle{
                id:maintop2_midd_shi
                anchors.fill: parent
                color:Qt.rgba(1,1,1,0);
                visible: false
                Yu_yin{
                    sour: "qrc:/yu_yin/yu_sb.png"
                    txt:"我不太明白你的意思"
                }
            }
        }
    }

    Rectangle {     //中间块
        id: swipeView
        width: parent.width
        height: parent.height*0.53;
        anchors.top:miantop1.bottom;

        Page1 {    //食品页面
            id:page1;
         //   visible: false;
            anchors.fill: parent
        }
        Page2 {     //选择数量和支付页面
            id:page2;
            visible: false;
            anchors.fill: parent
        }
        Page3 {     //正在跳转页面
            id:page3;
            visible: false;
            anchors.fill: parent
        }
        Page5 {    //错误代码页面
            id:page5;
            visible: false;
            anchors.fill: parent
        }
        Page6 {     //出货成功页面
            id:page6;
            visible: false;
            anchors.fill: parent
        }
        Page7 {     //出货失败页面
            id:page7;
            visible: false;
            anchors.fill: parent
        }
    }
    Page4 {       //购物码输入页面
        id:page4
        visible: false;
        width: parent.width;
        height: parent.height;
    }

    Rectangle{        //最下方按钮
        width: parent.width;
        height: parent.height*0.07;
        anchors.top: swipeView.bottom;
        color: "#363636"

        RowLayout{
            id:layout
            anchors.fill: parent
            spacing: 1;
            Rectangle{     //购物框
                id:button_1
                Layout.fillWidth: true
                Layout.preferredWidth:parent.width/5
                Layout.minimumHeight: parent.height
                But{
                    width: parent.width
                    height: parent.height
                    btn_image: "qrc:/new/prefix1/a_53.png"
                    txt:qsTr("购物");
                    //txt:parent.currentTime(mediaplay.position)
                }
                MouseArea{
                    anchors.fill: parent;
                    onPressed: {

                        page2.visible = false;
                        page3.visible = false;
                        page4.visible = false;
                        page5.visible = false;
                        page6.visible = false;
                        page7.visible = false;

//                        page2_3.visible = false;     //支付方式界面
//                        page2_3_z.visible = true;       //选择数量界面
//                        page2_3_z_2.visible = true;     //选择数量框
//                        page2_4_time.visible = false;       //倒计时框
                        page1.visible = true;
                    }
                }
            }
            Rectangle{      //演示框
                id:button_2
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width/5
                Layout.minimumHeight: parent.height
                But{
                    width: parent.width
                    height: parent.height
                    btn_image: "qrc:/new/prefix1/a_56.png"
                    txt:qsTr("演示");
                }
            }
            Rectangle{      //语音框
                id:button_3
                Layout.fillWidth: true
                Layout.preferredWidth:parent.width/5
                Layout.minimumHeight: parent.height
                But{
                    id:yu_yin
                    width: parent.width
                    height: parent.height
                    btn_image: "qrc:/new/prefix1/a_58.png"
                    txt:qsTr("语音");
                }
                MouseArea{
                    anchors.fill: parent;
                    property int status: 1  //默认播放
                    onReleased: {
                        yu_yin.btn_image = "qrc:/new/prefix1/t_58.png";
                     //   mediaplay.pause();       // 视频暂停
                        if(status===1){
                            mediaplay.pause();
                            console.log("start")
                            status=0;
                        }
                        else{
                            mediaplay.play() ;
                            console.log("pause")
                            status=1;
                        }


                    }
                }
            }
            Rectangle{       //购物码框
                id:button_4
                Layout.fillWidth: true
                Layout.preferredWidth:parent.width/5
                Layout.minimumHeight: parent.height
                But{
                    width: parent.width
                    height: parent.height
                    btn_image: "qrc:/new/prefix1/a_60.png"
                    txt:qsTr("购物码");
                 }
                MouseArea{
                    anchors.fill: parent;
                    onPressed: {
                        page1.visible = false;
                        page2.visible = false;
                        page3.visible = false;
                        page4.visible = true;
                        page5.visible = false;
                        page6.visible = false;
                        page7.visible = false;

                        //调用c++函数  发送信号初始化键盘
                        qsen.send_key_signal()
                    }
                }
            }
            Rectangle{       //活动框
                id:button_5
                Layout.fillWidth: true
                Layout.preferredWidth:parent.width/5
                Layout.minimumHeight: parent.height
                But{
                    width: parent.width
                    height: parent.height
                    btn_image: "qrc:/new/prefix1/a_63.png"
                    txt:qsTr("活动");
                 }
            }
        }
    }
}


