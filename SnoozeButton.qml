// Copyright (C) 2017 Allegorithmic
//
// This software may be modified and distributed under the terms
// of the MIT license.  See the LICENSE file for details.

import AlgWidgets.Style 1.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Button
{
  id: root
  antialiasing: true
  enabled: progressBar.value!=0
  width: 32
  height: 32
  tooltip: "Snooze autosave"

  style: ButtonStyle {
    background: Rectangle {
        implicitWidth: root.width
        implicitHeight: root.height
        color: root.hovered ?
          "#262626" :
          "transparent"
    }
  }
  
  property bool saving: false
  property bool startProgress: false
  property int remainingTime: 0
  property alias progressMaxValue: progressBar.to
  property bool active: true

  Rectangle
  {
    anchors.fill: parent
    color: "transparent"

    Rectangle
    {
      id: progressBar
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
      height: width * value
      property real to: 1
      property real value: startProgress && active ? remainingTime / to : 0
      color: root.hovered ?
        Qt.rgba(0.133, 0.498, 0.427, 1.0) :
        Qt.rgba(0.184, 0.698, 0.612, 1.0)
    }

    Image
    {
      id: button
      anchors.fill: parent
      anchors.margins: 8
      source: "bell.svg"
      fillMode: Image.PreserveAspectFit
      sourceSize.width: root.width
      sourceSize.height: root.height
      mipmap: true
      opacity: progressBar.value != 0 ?
        1.0:
        0.3
    }

  }
}