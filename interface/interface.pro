TEMPLATE = app

QT += qml quick widgets
QT += sql network

CONFIG += c++11

SOURCES += main.cpp \
    qsend.cpp \
    get_media_path.cpp \
    food_date.cpp \
    http.cpp \
    interfacecontrol.cpp

RESOURCES += qml.qrc \
    image.qrc

#此为电脑端
#INCLUDEPATH +=/home/mjl/Qt相关/部署量贩售卖机程序记录/语音识别/电脑识别/include
#LIBS += -lrt -ldl -lpthread -lasound  -L/home/mjl/Qt相关/部署量贩售卖机程序记录/语音识别/源码/Linux_voice_1.109/libs/x64 -lmsc
#此为arm端
#INCLUDEPATH += /home/mjl/Qt相关/部署量贩售卖机程序记录/语音识别/电脑识别/include /home/mjl/build/usr/include
#LIBS += -lrt -ldl -lpthread -L/home/mjl/build/usr/lib/arm-linux-gnueabihf/ -lasound  -L/home/mjl/Qt相关/部署量贩售卖机程序记录/语音识别/源码/Linux_voice_1.109/libs/RaspberryPi/ -lmsc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /home/pi
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    qsend.h \
    get_media_path.h \
    food_date.h \
    http.h \
    interfacecontrol.h \
    globalvarible.h



