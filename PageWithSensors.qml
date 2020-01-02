import QtQuick 2.0
import QtQuick.Controls 2.12
import QtSensors 5.11
import QtSensors 5.11 as Sensors

Item {

    //    models
    ListModel {
        id: sensorListDataModel
        property var sensorList: null

        Component.onCompleted: {
            sensorList = QmlSensors.sensorTypes();
        }
    }

    //  views
    ScrollView {
        anchors.fill: parent

        Component.onCompleted: {
            console.log(height);
        }


        ListView {
            width: parent.width
            model: sensorListDataModel.sensorList

            delegate: ItemDelegate {
                id: sensorListItemDelegate
                width: parent.width
                height: 104
                highlighted: false

                property int borderWidth: 2

                Rectangle {
                    id: listItemBorder
                    width: parent.width
                    height: parent.height
                    color: "#00000000"
                    radius: 2
                    border.width: parent.borderWidth
                    border.color: "#e0e0a8"
                }

                Text {
                    id: sensorListItemDescription
                    text: modelData
                    x: parent.borderWidth
                    y: 2
                    width: parent.width - parent.borderWidth
                    height: parent.height / 4
                    font.pointSize: 12
                    color: "#e0e0a8"
                }

                Text {
                    id: sensorListItemDelegateText_2
                    x: parent.borderWidth
                    y: parent.height / 4 + parent.borderWidth
                    text: modelData
                    width: parent.width - parent.borderWidth
                    height: 3 * parent.height / 4
                    font.pointSize: 12
                    color: "#e0e0a8"
                }

                Button {
                    id: itemActivateButton
                    visible: false
                    enabled: false
                    width: 100
                    x: parent.width - parent.borderWidth - width
                    y: parent.height - height

                    Text {
                        anchors.fill: parent
                        text: qsTr("stop measure")
                        font.pointSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "#e0e0a8"
                    }

                    //                    todo
                    onClicked: {
                        visible: false
                        enabled: false
                        if (modelData == "QCompass") {
                            compass.active = false
                        }
                    }

                }

                MouseArea {
                    id: listItemBorderArea
                    anchors.fill: parent
                    onClicked: {
                        // mutual behaviour
                        itemActivateButton.visible = true
                        itemActivateButton.enabled = true

                        // behaviour depends on sensor
                        if (modelData == "QCompass") {
                            sensorListItemDescription.text = compass.description
                            compass.active = true
                        }
                        else if (modelData == "QPressureSensor") {
                            sensorListItemDescription.text = pressureSensor.description
                            pressureSensor.active = true
                        }
                        else if (modelData == "QMagnetometer") {
                            sensorListItemDescription.text = magnetometer.description
                            magnetometer.active = true
                        }
                        else if (modelData == "QLightSensor") {
                            sensorListItemDescription.text = lightSensor.description
                            lightSensor.active = true
                        }
                    }
                }

                // sensors of interest
                Compass {
                    id: compass
                    active: false

                    onReadingChanged: {
                        if (modelData == "QCompass") {
                            sensorListItemDelegateText_2.text = reading.azimuth
                        }
                    }
                }

                PressureSensor {
                    id: pressureSensor
                    active: false

                    onReadingChanged: {
                        if (modelData == "QPressureSensor") {
                            sensorListItemDelegateText_2.text = reading.pressure +
                                    "\t" + reading.temperature
                        }
                    }
                }

                Magnetometer {
                    id: magnetometer
                    active: false

                    onReadingChanged: {
                        if (modelData == "QMagnetometer") {
                            sensorListItemDelegateText_2.text = reading.x +
                                    "\n" + reading.y + "\n" + reading.z +
                                    "\n" + reading.calibrationLevel
                        }
                    }
                }

                LightSensor {
                    id: lightSensor
                    active: false

                    onReadingChanged: {
                        if (modelData == "QLightSensor") {
                            sensorListItemDelegateText_2.text = reading.illuminance
                        }
                    }
                }
            }
        }
    }
}
