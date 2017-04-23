import QtQuick 2.4


Page4Form {
    id:root

    property alias attr: attr
    property alias root_func: root_func

    Connections{
        target: qsen;
        onSendkey:{      //初始化界面数据
            attr.key_num = "";
            attr.a = 1;
            attr.flag = 0;
            attr.flag_wei = 0;
            num_1_txt.text = "";
            num_2_txt.text = "";
            num_3_txt.text = "";
            num_4_txt.text = "";
            num_5_txt.text = "";
            num_6_txt.text = "";
            ti_shi.visible = false;
        }
    }

    QtObject{          //自定义变量
        id:attr
        property string key_num;     //按下数字几
        property int a: 1;
        property int flag:0;    //删除标记
        property int flag_wei:0    //满6位限制
    }

    Rectangle{       //键盘框
        id:key
        width: parent.width
        height: parent.height*0.5
        y:parent.height*0.4
        color: "#ff9829"

        Grid{
            id:key_grid
            rows:4;
            columns: 3;
            anchors.fill: parent

            anchors.topMargin: 1
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            anchors.bottomMargin: 1

            Rectangle{
                id:key_1
                width: parent.width/3
                height: parent.height/4
              Key{
                    id:key_1_text
                    width: parent.width
                    height: parent.height
                    txt: "1"
               }
                MouseArea{
                    id:key_1_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_1_text.txt;
                        root_func.num_bian();
                    }
               }
            }
            Rectangle{
                id:key_2
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_2_text
                    width: parent.width
                    height: parent.height
                    txt: "2"
                }
                MouseArea{
                    id:key_2_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_2_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_3
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_3_text
                    width: parent.width
                    height: parent.height
                    txt: "3"
                }
                MouseArea{
                    id:key_3_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_3_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_4
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_4_text
                    width: parent.width
                    height: parent.height
                    txt: "4"
                }
                MouseArea{
                    id:key_4_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_4_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_5
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_5_text
                    width: parent.width
                    height: parent.height
                    txt: "5"
                }
                MouseArea{
                    id:key_5_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_5_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_6
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_6_text
                    width: parent.width
                    height: parent.height
                    txt: "6"
                }
                MouseArea{
                    id:key_6_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_6_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_7
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_7_text
                    width: parent.width
                    height: parent.height
                    txt: "7"
                }
                MouseArea{
                    id:key_7_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_7_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_8
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_8_text
                    width: parent.width
                    height: parent.height
                    txt: "8"
                }
                MouseArea{
                    id:key_8_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_8_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_9
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_9_text
                    width: parent.width
                    height: parent.height
                    txt:"9"
                }
                MouseArea{
                    id:key_9_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_9_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_10
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_10_text
                    width: parent.width
                    height: parent.height
                    txt: "删除"
                }
                MouseArea{
                    id:key_10_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_10_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_11
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_11_text
                    width: parent.width
                    height: parent.height
                    txt: "0"
                }
                MouseArea{
                    id:key_11_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_11_text.txt;
                        root_func.num_bian();
                    }
                }
            }
            Rectangle{
                id:key_12
                width: parent.width/3
                height: parent.height/4
                Key{
                    id:key_12_text
                    width: parent.width
                    height: parent.height
                    txt: "确认"
                }
                MouseArea{
                    id:key_12_mouse
                    anchors.fill: parent
                    onPressed: {
                        attr.key_num = key_12_text.txt;
                        root_func.num_bian();
                    }
                }
            }
        }
    }
    Rectangle{        //按键显示功能实现
        id:root_func
        function num_bian(){

            attr.a = attr.a*10;
            console.log("att=  ",attr.key_num ,attr.a);

            if(attr.a > 10000000){   //满6为标记
                attr.flag_wei = 1;
                attr.a = attr.a/10;
            }
            else
                attr.flag_wei =0

            if(attr.a < 1){    //按键删除键过多
                attr.a = 10
            }

            if(attr.key_num == "删除"){     //按删除键
              //  console.log("atqw");
                if(attr.a == 100)   { num_1_txt.text=" " }
                if(attr.a == 1000)  { num_2_txt.text=" " }
                if(attr.a == 10000)  { num_3_txt.text=" " }
                if(attr.a == 100000)  { num_4_txt.text=" " }
                if(attr.a == 1000000)  { num_5_txt.text=" " }
                if(attr.a == 10000000)  { num_6_txt.text=" " }

                attr.a =attr.a/100;
                attr.flag = 1;     //标记位
            }
            if(attr.key_num == "确认"){     //按确认键
                attr.a =attr.a/10;
                attr.flag = 1;
                if(attr.a == 1000000){       //输入正确 跳转窗口
                    console.log("确认 跳转")
                    page4.visible = false;
                    page6.visible = true;

                }
                if (1){                //输入错误 重新输入
                    ti_shi.visible = true;
                    num_1_txt.text = "";
                    num_2_txt.text = "";
                    num_3_txt.text = "";
                    num_4_txt.text = "";
                    num_5_txt.text = "";
                    num_6_txt.text = "";
                }
            }

            if(attr.flag == 0 && attr.flag_wei == 0){   //显示
                switch(attr.a){
                    case 10:
                        num_1_txt.text = attr.key_num;
                        break;
                    case 100:
                        num_2_txt.text = attr.key_num;
                        break;
                    case 1000:
                        num_3_txt.text = attr.key_num
                        break;
                    case 10000:
                        num_4_txt.text = attr.key_num;
                        break;
                    case 100000:
                        num_5_txt.text = attr.key_num;
                        break;
                    case 1000000:
                        num_6_txt.text = attr.key_num;
                        break;
                }
            }
            attr.flag = 0;
        }
    }
}
