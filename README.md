# Raspberry Vertretungsplan einrichten

## Inhaltsverzeichnis

- [0. Vorwort](#0-vorwort)
- [1. Einrichtung](#1-einrichtung)
  - [1.1 Image](#11-image)
  - [1.2 Grundeinstellungen](#12-grundeinstellungen)
  - [1.3 Installation von PiOSK (Marienschul-Edition)](#13-installation-von-piosk-marienschul-edition)
- [2. Konfiguration](#2-konfiguration)


## 0. Vorwort

Nach längerem Testen habe ich mich dazu entschieden, auf eine „fertige“ Open-Source-Lösung zu wechseln: [PiOsk](https://github.com/debloper/piosk).  
Diese habe ich anschließend an die Bedürfnisse der Marienschule angepasst: [piosk-Marienschule](https://github.com/LABSTORM-MG/piosk-Marienschule/)

Der große Vorteil dieser Lösung ist, dass sie plattformübergreifend auf Raspberry Pi 4 und 5 läuft und alle kleinen Anpassungen, die ich bisher in einzelnen Skripten im System verteilt hatte, in einem Paket gut verwaltet. Außerdem bietet sie eine sehr einfache Möglichkeit, die anzuzeigende Website zu ändern.

**Sicherheitsaspekt:** Ich habe den Code selbst Zeile für Zeile vollständig überprüft und das Repository „geforkt“ (also eine Kopie erstellt, die nur noch von mir bearbeitet werden kann). Es gibt keine automatischen Updates, welche Änderungen vornehmen könnten. Nach der Installation habe weder ich – noch eine andere Person – von außen Zugriff, oder die Möglichkeit, Änderungen vorzunehmen.

> [30.03.2025] ~Lennart Bergmann 

---

## 1. Einrichtung

### 1.1 Image

Mit dem [Raspberry Pi Imager](https://www.raspberrypi.com/software/) kann man ganz einfach das Betriebssystem auf die SD-Karte flashen lassen:

```
1. Modell wählen  
2. Betriebssystem wählen: "Raspberry Pi OS (32-bit)"  
3. SD-Karte wählen und auf "Weiter" klicken  
4. Bei der Frage, ob Voreinstellungen vorgenommen werden sollen, auf "Einstellungen bearbeiten" klicken  
5. Unter "Allgemein" Hostname, Benutzername, Passwort und Spracheinstellungen festlegen  
6. Unter "Dienste" SSH aktivieren und Passwort zur Authentifizierung wählen  
7. Unter "Optionen" Telemetrie deaktivieren  
8. Auf "Speichern" klicken und dann zweimal mit "Ja" bestätigen, um das Schreiben des Images auf die SD-Karte zu starten.
```

Wenn das Schreiben abgeschlossen ist, die SD-Karte in den Raspberry stecken und diesen mit Internet und Strom versorgen.

---

### 1.2 Grundeinstellungen

1. **[OPTIONAL] Verbindung mit dem Raspberry per SSH:**  
Die IP-Adresse kann entweder mit Tools wie z.B. [Advanced IP Scanner](https://www.advanced-ip-scanner.com/de/) oder [Angry IP Scanner](https://angryip.org/download/) von einem anderen PC im selben Netzwerk gefunden werden, oder indem Sie eine Tastatur und einen Bildschirm an den Raspberry anschließen und mit der Tastenkombination `Strg + Alt + T` ein Terminal öffnen und dort den Befehl `ip addr` eingeben.  

	Nun verbinden Sie sich mit einem SSH-Client (z.B. [PuTTY](https://www.putty.org/)) oder dem Windows-Terminal (mit dem Befehl `ssh <USERNAME>@<IP>`).

2. **X11 als Window-System einstellen:**  
Raspberry Pi OS verwendet in neueren Versionen Wayland anstelle von X11. Bestimmte benötigte Funktionen sind mit Wayland nicht möglich bzw. deutlich komplizierter umzusetzen. Die folgenden Schritte setzen X11 als Standard-Window-System:

```bash
sudo raspi-config
```

Dies öffnet ein Einstellungsmenü, das sich mit den Pfeiltasten und Enter navigieren lässt.  
Unter dem Punkt `6 Advanced Options` und dann `A6 Wayland` die Option `W1 X11` auswählen und bestätigen.  
Nun auf `<Finish>` gehen und den Raspberry neu starten.

---

### 1.3 Installation von PiOSK (Marienschul-Edition)

Um PiOSK zu installieren, folgenden Befehl auf dem Raspberry ausführen:

```bash
curl -sSL https://raw.githubusercontent.com/LABSTORM-MG/piosk-Marienschule/refs/heads/main/scripts/setup.sh | sudo bash -
```

Dieser Befehl setzt automatisch alle Einstellungen und lädt alle benötigten Dateien herunter.

---

## 2. Konfiguration

Um die Website(s), die angezeigt werden sollen, einzustellen, können Sie nun ganz einfach – von einem anderen PC im Netzwerk oder direkt auf dem Raspberry – per Webbrowser die IP des Raspberry aufrufen.  
Es können IPs, URLs oder Dateien (per `file:///<PATH>`) angegeben werden.

Wenn die gewünschten Adressen hinzugefügt oder entfernt wurden, mit „APPLY“ bestätigen.  
Der Raspberry startet anschließend neu und übernimmt die Änderungen.
