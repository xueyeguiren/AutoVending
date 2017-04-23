#include <QApplication>
#include <QQmlApplicationEngine>

#include "qsend.h"
#include "food_date.h"
#include "get_media_path.h"
#include "http.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Qsend>("cn.qSend",1,0,"Qsend");
    qmlRegisterType<food_date>("cn.food_date",1,0,"Food_date");
    qmlRegisterType<get_media_path>("cn.get_media_path",1,0,"Get_media_path");
    qmlRegisterType<http>("cn.http",1,0,"Http");



    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    return app.exec();
}
