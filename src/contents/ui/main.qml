/**
 * SPDX-FileCopyrightText: (C) 2020 Carl Schwan <carl@carlschwan.eu>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

import QtQuick 2.1
import org.kde.kirigami 2.12 as Kirigami
import QtQuick.Controls 2.14 as QQC2
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14


Kirigami.ApplicationWindow {
    id: root

    title: i18n("kontrast")
    
    Kirigami.PagePool {
        id: mainPagePool
    }

    globalDrawer: Kirigami.GlobalDrawer {
        title: i18n("kontrast")
        titleIcon: "applications-graphics"
        actions: [
            Kirigami.PagePoolAction {
                text: i18n("Home")
                icon.name: "go-home"
                pagePool: mainPagePool
                page: "MainPage.qml"
            },
            Kirigami.PagePoolAction {
                text: i18n("Saved Colors")
                icon.name: "star"
                pagePool: mainPagePool
                page: "FavoritePage.qml"
            },
            Kirigami.PagePoolAction {
                text: i18n("About")
                icon.name: "about"
                pagePool: mainPagePool
                page: "AboutPage.qml"
            }
        ]
    }

    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

    pageStack.initialPage: mainPagePool.loadPage("MainPage.qml")
}
