import QtQuick 2.12
import QtQuick.Controls 2.12

import QtLocation 5.6
import QtPositioning 5.6

Page {
    width: 600
    height: 400
    visible: true

    Plugin {
        id: osmPlugin
        name: "osm"
    }

    Map {
        anchors.fill: parent
        plugin: osmPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }
}
