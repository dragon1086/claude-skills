# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | **Deutsch**

**Hören Sie auf zu raten, welches Tool Sie verwenden sollen. Lassen Sie Claude Code entscheiden.**

Tool Advisor analysiert Ihren Prompt und empfiehlt die optimale Kombination aus Tools, Agenten, MCP-Servern und Orchestrierungsmustern — mit **kopierfertigen Befehlen**, die Sie sofort ausführen können.

![Demo](./assets/demo.gif)

## Installation

**Option 1: Einzeilige Installation**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2: Über [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills
```

Zum Aktualisieren führen Sie denselben Befehl erneut aus.

## Verwendung

Fragen Sie einfach natürlich:

```
"Analysiere mit tool-advisor: Refaktorisierung des Auth-Moduls"
"tool-advisor, wie sollte ich diese Datenbankmigration angehen?"
"Was ist der beste Ansatz für die Implementierung der Benutzerauthentifizierung?"
```

Der Skill wird aktiviert, wenn Sie **tool-advisor** erwähnen oder nach Tool-Empfehlungen fragen.

## Funktionsweise

```
Ihr Prompt
    ↓
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. Lokales Inventar prüfen      │
│ 2. Komplexität bewerten         │
│ 3. Harness-Bedarf erkennen      │
│ 4. Plan Mode empfehlen?         │
│ 5. Agenten auswählen (3 Stufen) │
│ 6. MCP-Bedarf prüfen            │
│ 7. Installation vorschlagen     │
│ 8. Schnellaktion-Tabelle        │
└─────────────────────────────────┘
    ↓
🎯 Kopierfertige Befehle
```

## Funktionen

| Funktion | Beschreibung |
|----------|--------------|
| **Schnellaktion-Tabelle** | Kopierfertige Befehle zur sofortigen Ausführung |
| **Plan Mode Erkennung** | Empfiehlt `EnterPlanMode` für komplexe Aufgaben |
| **Harness-Muster** | Erkennt "bis", "weiter versuchen" → Ralph-Muster |
| **3-Stufen-Agentensuche** | Eingebaut → Lokal angepasst → Marketplace |
| **MCP-Empfehlung** | Zeigt Installationsstatus (✅/❌) mit Alternativen |
| **Human-in-the-loop** | Installiert niemals ohne Ihre Zustimmung |

## Beispiel

**Eingabe:**
```
Analysiere mit tool-advisor: Auth-Modul refaktorisieren für JWT-Token
```

**Ausgabe:**
```markdown
## Analyseergebnis

### 1. Klassifizierung
- Typ: Refaktorisierung/Architektur
- Komplexität: Komplex (5+ Dateien)

### 2. Harness
- Erforderlich: Nein

### 3. Plan Mode
- Empfohlen: Ja
- Grund: Mehrere Dateien, sicherheitsrelevant

### 4. Agent
- feature-dev (installiert)
- backend-developer (lokaler Agent)
- security-engineer (lokaler Agent)

### 5. Empfehlung
/feature-dev mit Plan Mode verwenden

---

## 🎯 Schnellaktion

| Ihre Situation | Kopieren und Einfügen |
|----------------|----------------------|
| Erst planen | `Plane das JWT-Refactoring` |
| Geführte Entwicklung | `/feature-dev` |
| Einfach machen | `Refaktorisiere Auth für JWT` |

→ Empfohlen: "Erst planen" (5+ Dateien, sicherheitsrelevant)
```

## Voraussetzungen

- Claude Code CLI

## Lizenz

MIT © 2026 dragon1086
