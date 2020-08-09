/**
 * SPDX-FileCopyrightText: (C) 2020 Carl Schwan <carl@carlschwan.eu>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

import QtQuick 2.1
import org.kde.kirigami 2.11 as Kirigami
import QtQuick.Controls 2.14 as QQC2
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14
import org.kde.kontrast.private 1.0
import QtQuick.Dialogs 1.0

Kirigami.ScrollablePage {
    id: mainPage
    property bool isMobile: Window.width <= Kirigami.Units.gridUnit * 30
    
    title: i18n("Contrast Checker")
    background: Rectangle {
        color: Kontrast.backgroundColor
    }
    
    ColumnLayout {
        ColorDialog {
            id: colorDialog
            property var target: "textColor";
            title: i18n("Please choose a color")
            onAccepted: {
                if (target === "textColor") {
                    Kontrast.textColor = colorDialog.color;
                } else {
                    Kontrast.backgroundColor = colorDialog.color;
                }
            }
        }
        Text {
            font.pointSize: mainPage.isMobile ? 20 : 40
            font.bold: true
            text: i18n("Contrast ratio: %1", Kontrast.contrast.toFixed(2))
            
            color: Kontrast.textColor
            Layout.fillWidth: true
        }
        Text {
            font.pointSize: mainPage.isMobile ? 13 : 18
            font.bold: true
            color: Kontrast.textColor
            Layout.fillWidth: true
            text: (Kontrast.contrast > 7 ? i18n("Perfect for normal and large text") : Kontrast.contrast > 4.5 ? i18n("Perfect for large text and good for normal text") : Kontrast.contrast > 3.0 ? i18n("Good for large text and bad for normal text") : i18n("Bad for large and normal text"))
        }
        
        Text {
            font.pointSize: mainPage.isMobile ? 12 : 14
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: i18n("Contrast is the difference in luminance or color that makes an object (or its representation in an image or display) distinguishable. In visual perception of the real world, contrast is determined by the difference in the color and brightness of the object and other objects within the same field of view.")
            color: Kontrast.textColor
        }
        
        GridLayout {
            Layout.fillWidth: true
            columns: mainPage.isMobile ? 1 : 3
            rowSpacing: Kirigami.Units.gridUnit
            
            ColumnLayout {
                Layout.fillWidth: true
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Text")
                    color: Kontrast.displayTextColor
                }
                
                QQC2.TextField {
                    text: Kontrast.textColor
                    font.pointSize: 35
                    color: Kontrast.displayTextColor
                    background: Rectangle { color: Kontrast.backgroundColor }
                    onEditingFinished: Kontrast.textColor = text
                    Layout.preferredWidth: contentWidth + Kirigami.Units.gridUnit
                    maximumLength: 7
                    
                    QQC2.Button {
                        icon.name: "color-picker"
                        anchors {
                            left: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        onClicked: {
                            colorDialog.color = Kontrast.textColor
                            colorDialog.target = "textColor";
                            colorDialog.visible = true;
                        }
                    }
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Hue %1°", Kontrast.textHue)
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.textHue
                    to: 359
                    onMoved: Kontrast.textHue = value
                    Layout.fillWidth: true
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Saturation %1", (Kontrast.textSaturation / 255).toFixed(2))
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.textSaturation
                    to: 255
                    onMoved: Kontrast.textSaturation = value
                    Layout.fillWidth: true
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Lightness %1", (Kontrast.textLightness / 255).toFixed(2))
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.textLightness
                    to: 255
                    onMoved: Kontrast.textLightness = value
                    Layout.fillWidth: true
                }
            }
            
            Kirigami.Separator {
                visible: mainPage.isMobile
                Layout.fillWidth: true
                color: Kontrast.displayTextColor
            }
            
            ColumnLayout {
                Layout.fillWidth: true
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Background")
                    color: Kontrast.displayTextColor
                }
            
                QQC2.TextField {
                    text: Kontrast.backgroundColor
                    font.pointSize: 35
                    color: Kontrast.displayTextColor
                    background: Rectangle { color: Kontrast.backgroundColor }
                    onEditingFinished: Kontrast.backgroundColor = text
                    Layout.preferredWidth: contentWidth + Kirigami.Units.gridUnit
                    maximumLength: 7
                    QQC2.Button {
                        icon.name: "color-picker"
                        anchors {
                            left: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        onClicked: {
                            colorDialog.color = Kontrast.backgroundColor;
                            colorDialog.target = "backgroundColor";
                            colorDialog.visible = true;
                        }
                    }
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Hue %1°", Kontrast.backgroundHue)
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.backgroundHue
                    to: 359
                    onMoved: Kontrast.backgroundHue = value
                    Layout.fillWidth: true
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Saturation %1", (Kontrast.backgroundSaturation / 255).toFixed(2))
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.backgroundSaturation
                    to: 255
                    onMoved: Kontrast.backgroundSaturation = value
                    Layout.fillWidth: true
                }
                
                Text {
                    Layout.topMargin: Kirigami.Units.largeSpacing
                    text: i18n("Lightness %1", (Kontrast.backgroundLightness / 255).toFixed(2))
                    color: Kontrast.displayTextColor
                }
                
                QQC2.Slider {
                    from: 0
                    value: Kontrast.backgroundLightness
                    to: 255
                    onMoved: Kontrast.backgroundLightness = value
                    Layout.fillWidth: true
                }
            }
        }
        
        RowLayout {
            Layout.topMargin: Kirigami.Units.gridUnit * 2
            QQC2.Button {
                text: i18n("Invert")
                onClicked: Kontrast.reverse()
                icon.name: "reverse"
            }
            
            QQC2.Button {
                text: i18n("Randomize")
                onClicked: Kontrast.random()
                icon.name: "randomize"
            }
            
            QQC2.Button {
                text: i18n("Mark as favorite")
                icon.name: "favorite"
                onClicked: if (!ColorStore.addColor("Lorem Ipsum", Kontrast.textColor, Kontrast.backgroundColor)) {
                    applicationWindow().showPassiveNotification(i18n("Failed to save color"))
                }
            }
        }
    }
}
