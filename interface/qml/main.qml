import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import "qrc:/js/js/NetWork.js" as API
import "qrc:/js/js/Weather.js" as WR
ApplicationWindow {
    id:appWindow;
    property var tt:WR.test();
    visible: true
    width: 540
    height: 960
//    11
    title: qsTr("勃达自动售卖机主页")
    Rectangle{
        id:rec_ads;
        width: parent.width;
        height: parent.height*0.328//630px
        Weather{//自定义天气显示控件
            visible: false;
            id:wea;
        }
    }
    Rectangle{                         //中间商品页
            id: rec_mainInterface
            width: parent.width;
            height: parent.height*0.578//1110px
            anchors{
                top:rec_ads.bottom;
                left:parent.left;
            }
            MainInterface{
                id:app_mainInterface;
                width: parent.width;
                height: parent.height;
                page_name: "goods_swipeView";
            }
    }


    Rectangle{        //最下方按钮
            width: parent.width;
            height: parent.height*0.094;//180px
            anchors.top: rec_mainInterface.bottom;
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
                        btn_image: "qrc:/operation/images/operation/a_53.png"
                        txt:qsTr("购物");
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
                        btn_image: "qrc:/operation/images/operation/a_56.png"
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
                        btn_image: "qrc:/operation/images/operation/a_58.png"
                        txt:qsTr("语音");
                    }
                    MouseArea{
                        anchors.fill: parent;
                        property int status: 1  //默认播放
                        onReleased: {
                            yu_yin.btn_image = "qrc:/operation/images/operation/t_58.png";
                         //   mediaplay.pause();       // 视频暂停
//                            if(status===1){
//                                mediaplay.pause();
//                                console.log("start")
//                                status=0;
//                            }
//                            else{
//                                mediaplay.play() ;
//                                console.log("pause")
//                                status=1;
//                            }
                            WR.funcShowWeather(wea);

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
                        btn_image: "qrc:/operation/images/operation/a_60.png"
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
                        btn_image: "qrc:/operation/images/operation/a_63.png"
                        txt:qsTr("活动");
                     }
                }
            }
        }
    }  
