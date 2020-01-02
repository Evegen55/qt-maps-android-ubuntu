import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 720
    height: 1280
    title: qsTr("Tabs")

    //    menu containing two menu items
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: {
                    console.log("Application closed.");
                    Qt.quit();
                }
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex


        PageWithMapOSMForm {
        }

        PageWithMapMapboxGLForm {
        }

        PageWithSensors{
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("OSM map")
        }
        TabButton {
            text: qsTr("MapboxGL")
        }
        TabButton {
            text: qsTr("sensors")
        }
    }
}
