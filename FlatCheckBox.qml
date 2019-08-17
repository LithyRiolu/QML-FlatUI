import QtQuick 2.7
import QtQuick.Controls 2.0 as QQControls
import "."

QQControls.CheckBox {
    id: root
    text: qsTr("Checkbox")

    font {
        family: FlatUI.latoRegularFont.name
        pixelSize: 14
    }

    FlatButtonStyle {
        id: style
        name: "checkable"
        __focused: root.activeFocus
        __checked: root.checked
        leftPadding: 12
        topPadding: 8
    }

    indicator: Text {
        font.family: FlatUI.glyphFont.name
        font.pixelSize: 18
        text: area.containsMouse || root.checked ? FlatUI.glyphFont.markedCheckBox : FlatUI.glyphFont.unmarkedCheckBox
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: style.leftPadding
        topPadding: style.topPadding
        color: style.color

        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: root.checked = !root.checked
        }
    }

    contentItem: Text {
        text: root.text
        font: root.font
        color: style.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: root.indicator.width + root.spacing
    }
}

