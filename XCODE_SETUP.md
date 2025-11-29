# 🎯 Xcode Setup Guide

Dieses Projekt kann auf **zwei Wege** in Xcode geöffnet werden:

## ✅ Option 1: Swift Package in Xcode öffnen (Empfohlen - Schnellste Methode)

Das Projekt ist bereits als Swift Package konfiguriert und kann direkt in Xcode geöffnet werden!

### Schritte:

```bash
# 1. Öffne das Package.swift in Xcode
open Package.swift
```

**Oder:**

1. Öffne Xcode
2. Wähle `File → Open`
3. Navigiere zu `/Users/paul/.gemini/antigravity/scratch/ios-app`
4. Wähle `Package.swift`
5. Klicke auf "Open"

### Was du dann machen kannst:

- ✅ Code bearbeiten
- ✅ Tests ausführen (`Cmd + U`)
- ✅ Swift Package bauen
- ❌ Direkt auf iOS Simulator laufen lassen (benötigt iOS App Target)

---

## 📱 Option 2: Vollständiges iOS App Projekt erstellen

Für eine vollwertige iOS App, die auf dem Simulator läuft:

### Automatischer Weg (mit Skript):

```bash
# Führe das Setup-Skript aus
./create-xcode-project.sh
```

### Manueller Weg:

1. **Öffne Xcode**

2. **Erstelle ein neues Projekt:**
   - `File → New → Project`
   - Wähle: **iOS** → **App**
   - Klicke auf "Next"

3. **Projekteinstellungen:**
   - **Product Name:** `MyApp`
   - **Team:** (Wähle dein Development Team)
   - **Organization Identifier:** `com.mycompany` (oder deine Domain)
   - **Bundle Identifier:** `com.mycompany.MyApp`
   - **Interface:** `SwiftUI` ✅
   - **Language:** `Swift` ✅
   - **Storage:** None
   - **Include Tests:** ✅ Aktivieren
   - Klicke auf "Next"

4. **Speicherort:**
   - Speichere in: `/Users/paul/.gemini/antigravity/scratch/ios-app-xcode`
   - Klicke auf "Create"

5. **Dateien importieren:**
   
   a. Lösche die generierten Standard-Dateien:
   - `ContentView.swift`
   - `MyAppApp.swift`
   
   b. Ziehe diese Ordner in dein Xcode Projekt:
   - `App/`
   - `Models/`
   - `ViewModels/`
   - `Views/`
   - `Services/`
   - `Utilities/`
   
   c. Wenn Xcode fragt, wähle:
   - ✅ "Copy items if needed"
   - ✅ "Create groups"
   - ✅ Füge zu Target "MyApp" hinzu

6. **Info.plist konfigurieren:**
   - Die Info.plist-Einstellungen sind bereits im Skript vorbereitet

7. **Build und Run:**
   - Wähle ein iPhone Simulator (z.B. iPhone 15 Pro)
   - Drücke `Cmd + R` zum Bauen und Ausführen

---

## 🚀 Option 3: Xcode Workspace (Fortgeschritten)

Für größere Projekte mit mehreren Targets:

```bash
# Workspace erstellen
mkdir -p MyApp.xcworkspace/xcshareddata

# Workspace Datei erstellen (wird manuell gemacht)
```

Dann in Xcode öffnen und Projekte/Packages hinzufügen.

---

## 🔍 Projekt-Struktur nach Setup

Nach dem Xcode-Setup sollte dein Projekt so aussehen:

```
MyApp/
├── MyApp.xcodeproj/          # Xcode Projekt
│   ├── project.pbxproj
│   └── xcshareddata/
│
├── MyApp/                     # App Target
│   ├── App/
│   │   └── MyApp.swift       # @main entry point
│   ├── Models/
│   │   └── User.swift
│   ├── ViewModels/
│   │   └── ContentViewModel.swift
│   ├── Views/
│   │   └── ContentView.swift
│   ├── Services/
│   │   └── NetworkService.swift
│   ├── Utilities/
│   │   ├── Extensions.swift
│   │   └── Config.swift
│   ├── Assets.xcassets/
│   ├── Info.plist
│   └── Preview Content/
│
└── MyAppTests/               # Test Target
    └── MyAppTests.swift
```

---

## ✅ Schnelltest nach Setup

Nach dem Öffnen in Xcode:

1. **Build:** `Cmd + B`
   - Sollte erfolgreich kompilieren

2. **Tests:** `Cmd + U`
   - Alle Tests sollten grün sein

3. **Run:** `Cmd + R`
   - App startet auf dem Simulator
   - Zeigt die schöne Welcome-Screen mit Gradient

---

## 🎨 Erste Schritte nach dem Setup

1. **Ändere den App-Namen:**
   - In `Config.swift` → `appName`
   - In Xcode Project Settings → Display Name

2. **Ändere die Bundle ID:**
   - In Xcode Project Settings → Bundle Identifier

3. **Füge dein App Icon hinzu:**
   - Ziehe Bilder in `Assets.xcassets/AppIcon.appiconset`
   - Benötigt: 1024x1024 px Icon

4. **Konfiguriere die API:**
   - In `Config.swift` → `apiBaseURL`
   - Füge deine API-Keys hinzu

5. **Erstelle neue Screens:**
   - Neue SwiftUI Views in `Views/Screens/`
   - Neue ViewModels in `ViewModels/`

---

## 🆘 Troubleshooting

### Problem: "Cannot find 'User' in scope"

**Lösung:** Stelle sicher, dass alle Dateien zum Target hinzugefügt sind:
- Wähle die Datei in Xcode
- Öffne File Inspector (rechte Sidebar)
- Aktiviere "MyApp" unter "Target Membership"

### Problem: "No such module 'MyApp'"

**Lösung:** 
1. Clean Build Folder: `Cmd + Shift + K`
2. Rebuild: `Cmd + B`

### Problem: Build Errors nach Import

**Lösung:**
- Stelle sicher, dass alle Imports korrekt sind
- `@testable import MyApp` in Test-Dateien
- Keine doppelten Dateien

### Problem: Simulator startet nicht

**Lösung:**
1. Wähle ein anderes Simulator-Device
2. Xcode → Preferences → Locations → Command Line Tools auswählen
3. Simulator neu starten

---

## 📚 Nützliche Xcode Shortcuts

- `Cmd + B` - Build
- `Cmd + R` - Run
- `Cmd + .` - Stop
- `Cmd + U` - Run Tests
- `Cmd + Shift + K` - Clean Build
- `Cmd + Option + Enter` - Show Preview Canvas (SwiftUI)
- `Cmd + Shift + L` - Show Library (UI Components, SF Symbols)
- `Cmd +Click` - Quick Actions (Jump to Definition, etc.)

---

## 🎯 Nächste Schritte

Jetzt kannst du:

1. ✅ Code in Xcode bearbeiten
2. ✅ Neue Features hinzufügen
3. ✅ Tests schreiben und ausführen
4. ✅ Auf iOS Simulator testen
5. ✅ Auf einem echten iPhone testen (benötigt Apple Developer Account)
6. ✅ In TestFlight deployen
7. ✅ In den App Store hochladen

---

**Viel Erfolg mit deiner iOS App! 🚀**
