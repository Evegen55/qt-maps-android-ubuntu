import QtQuick 2.12
import QtQuick.Controls 2.12

import QtLocation 5.6
import QtPositioning 5.6

Page {
    width: 600
    height: 400
    visible: true

    Plugin {
        id: mapboxglPlugin
        name: "mapboxgl"

        PluginParameter {
            name: "mapboxgl.mapping.additional_style_urls"
            value: "mapbox://styles/mapbox/cjf4m44iw0uza2spb3q0a7s41"
        }
//        PluginParameter {
//            name: "mapboxgl.mapping.use_fbo"
//            value: "false"
//        }
    }

    Map {
        anchors.fill: parent
        plugin: mapboxglPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }
}
