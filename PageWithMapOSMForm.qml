import QtQuick 2.12
import QtQuick.Controls 2.12

import QtLocation 5.6
import QtPositioning 5.6

Item {
    width: 600
    height: 400
    visible: true

    PositionSource {
        id: positionSource
        active: true
        updateInterval: 1000
        preferredPositioningMethods: PositionSource.AllPositioningMethods
        onPositionChanged: {
            var coord = position.coordinate;
            console.log("Coordinate:", coord.longitude, coord.latitude);
            osm_map.center = coord;
        }
    }

    Map {
        id: osm_map
        anchors.fill: parent
        plugin:  Plugin {
            id: osmPlugin
            name: "osm"
        }
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14

        MapQuickItem {
            coordinate: osm_map.center
            sourceItem: Image {
                id: simpleMapItemImage
                source: "qrc:/static/174-free-google-maps-pointer.png"
            }
            anchorPoint.x: simpleMapItemImage.width / 2
            anchorPoint.y: simpleMapItemImage.hight
        }

    }
}
