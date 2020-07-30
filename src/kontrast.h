/*
 * SPDX-FileCopyrightText: (C) 2020 Carl Schwan <carl@carlschwan.eu>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

#pragma once

#include <QObject>
#include <QColor>
#include <QImage>
#include <KAboutData>

/**
 * @brief Main class that expose all the value to the QML.
 */
class Kontrast : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(QColor textColor READ textColor WRITE setTextColor NOTIFY textColorChanged)
    
    Q_PROPERTY(int textHue READ textHue WRITE setTextHue NOTIFY textColorChanged)
    
    Q_PROPERTY(int textSaturation READ textSaturation WRITE setTextSaturation NOTIFY textColorChanged)
    
    Q_PROPERTY(int textLightness READ textLightness WRITE setTextLightness NOTIFY textColorChanged)
    
    Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    
    Q_PROPERTY(int backgroundHue READ backgroundHue WRITE setBackgroundHue NOTIFY backgroundColorChanged)
    
    Q_PROPERTY(int backgroundSaturation READ backgroundSaturation WRITE setBackgroundSaturation NOTIFY backgroundColorChanged)
    
    Q_PROPERTY(int backgroundLightness READ backgroundLightness WRITE setBackgroundLightness NOTIFY backgroundColorChanged)
    
    Q_PROPERTY(qreal contrast READ contrast NOTIFY contrastChanged);
    
    Q_PROPERTY(QColor displayTextColor READ displayTextColor NOTIFY contrastChanged);
    
    Q_PROPERTY(KAboutData about READ about);

public:
    Kontrast(KAboutData about, QObject *parent = nullptr);
    virtual ~Kontrast() override = default;
    
    QColor textColor() const;
    void setTextColor(const QColor textColor);
    
    int textHue() const;
    void setTextHue(int hue);
    
    int textSaturation() const;
    void setTextSaturation(int saturation);
    
    int textLightness() const;
    void setTextLightness(int lightness);
    
    QColor backgroundColor() const;
    void setBackgroundColor(const QColor backgroundColor);
    
    int backgroundHue() const;
    void setBackgroundHue(int hue);
    
    int backgroundSaturation() const;
    void setBackgroundSaturation(int saturation);
    
    int backgroundLightness() const;
    void setBackgroundLightness(int lightness);
    
    qreal contrast() const;
    
    QColor displayTextColor() const;
    
    KAboutData about() const;
    
    Q_INVOKABLE void random();
    Q_INVOKABLE void reverse();
    
    Q_INVOKABLE QColor pixelAt(const QImage &image, int x, int y) const;
    
Q_SIGNALS:
    void textColorChanged();
    void backgroundColorChanged();
    void contrastChanged();

private:
    QColor m_textColor;
    QColor m_backgroundColor;
    KAboutData m_about;
};
