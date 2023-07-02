// SPDX-FileCopyrightText: 2020 Carl Schwan <carl@carlschwan.eu>
// SPDX-FileCopyrightText: 2020 Carson Black <uhhadd@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

#pragma once

#include <QColor>
#include <QSqlDatabase>
#include <QSqlTableModel>

/**
 * @brief Store all the user's favorite color combinations.
 */
class SavedColorModel : public QSqlTableModel
{
    Q_OBJECT

public:
    enum ColorRoles {
        TextColor = Qt::UserRole + 1,
        BackgroundColor,
    };

public:
    explicit SavedColorModel(QObject *parent = nullptr);

    ~SavedColorModel() override = default;

    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role) const override;

    Q_INVOKABLE bool addColor(const QString &name, const QColor &foreground, const QColor &background);
    Q_INVOKABLE bool removeColor(int index);

private:
    QSqlDatabase m_db;
};
