# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | [Français](./README.fr.md) | **Deutsch**

**Entdecken Sie Ihre Tool-Umgebung. Verstarken Sie Ihre Fahigkeiten.**

Tool Advisor scannt Ihre Laufzeitumgebung — MCP-Server, Skills, Plugins, CLI-Tools — und schlagt optimale Tool-Kombinationen als **unverbindliche Optionen** mit kopierfertigen Befehlen vor. Er stattet das Modell mit Wissen aus, das es sonst nicht hatte.

![Demo](./assets/demo.gif)

## Installation

**Option 1: Einzeilige Installation**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2: Uber [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills -y --agent claude-code
```

Zum Aktualisieren fuhren Sie denselben Befehl erneut aus.

## Verwendung

Fragen Sie einfach naturlich:

```
"Analysiere mit tool-advisor: Refaktorisierung des Auth-Moduls"
"tool-advisor, wie sollte ich diese Datenbankmigration angehen?"
"Was ist der beste Ansatz fur die Implementierung der Benutzerauthentifizierung?"
```

Der Skill wird aktiviert, wenn Sie **tool-advisor** erwahnen oder nach Tool-Empfehlungen fragen.

## Funktionsweise

```
Ihr Prompt
    ↓
┌──────────────────────────────────┐
│     Tool Advisor v3.0            │
│  „Verstarker, nicht Kommandant"  │
├──────────────────────────────────┤
│ 1. Umgebung entdecken            │
│    MCP / Skills / Plugins / CLI  │
│ 2. Aufgabe analysieren (3 Dim.)  │
│ 3. Fahigkeiten abgleichen        │
│ 4. Optionen vorschlagen (bis 3)  │
│ 5. Lucken identifizieren         │
│ 6. Performance-Tipps             │
└──────────────────────────────────┘
    ↓
Optionen + Schnellaktion-Tabelle
```

## Funktionen

| Funktion | Beschreibung |
|----------|--------------|
| **4-Schichten-Umgebungsscan** | Entdeckt MCP-Server, Skills, Plugins und CLI-Tools zur Laufzeit |
| **Minimale Aufgabenanalyse** | Nur 3 Dimensionen (Typ, Umfang, Merkmale) — keine Uber-Klassifizierung |
| **Multi-Optionen-Vorschlage** | Bis zu 3 Ansatze (Methodisch / Schnell / Tiefgehend) — nie aufgezwungen |
| **Luckenanalyse** | Schlagt fehlende Tools vor mit Hinweis „auch ohne diese machbar" |
| **Performance-Tipps** | Opus 4.6-spezifische Hinweise (Parallelitat, Hintergrund, Kontext) |
| **Human-in-the-loop** | Installiert niemals ohne Ihre Zustimmung |

## Beispiel

**Eingabe:**
```
Analysiere mit tool-advisor: Auth-Modul refaktorisieren fur JWT-Token
```

**Ausgabe:**
```markdown
## Tool Advisor v3.0 — Umgebungs- und Kompositionsanalyse

Prompt: `Auth-Modul refaktorisieren fur JWT-Token`

### Ihre Umgebung

| Schicht | Verfugbar |
|---------|----------|
| MCP-Server | lsp, context7 |
| Skills | /feature-dev, /code-review, /tdd |
| Plugins | oh-my-claudecode (33 Agenten) |
| CLI | git, node, pytest, docker |

### Aufgabenprofil
- **Typ**: Modifikation (Refaktorisierung)
- **Umfang**: Gross (~10+ Dateien)
- **Merkmale**: Benotigt Planung, hat Tests, Architekturentscheidung

### Relevante Fahigkeiten
- `lsp_diagnostics` — Typprufung nach Anderungen
- `ast_grep_search` — Session-Nutzungsmuster finden
- `/feature-dev` — Gefuhrter Entwicklungsworkflow
- `Explore` Subagent — Sichere schreibgeschutzte Untersuchung

### Vorgeschlagene Ansatze

**A — Methodisch** (Empfohlen)
Task(Explore) -> EnterPlanMode -> Edit stufenweise -> Bash(pytest)

**B — Skill-gefuhrt**
/feature-dev (verwaltet den gesamten Ablauf)

**C — Agenten parallel**
[Task(Explore, bg), WebSearch("JWT best practices")] -> planen -> implementieren

### Performance-Tipps
- Parallelitats-Moglichkeit: explore + web search konnen gleichzeitig laufen
- Hintergrund-Kandidat: Testausfuhrung

---

## Schnellaktion

| Ansatz | Kopieren und Einfugen |
|--------|----------------------|
| Methodisch | Mit `Task(Explore)` die Codebasis erkunden |
| Skill-gefuhrt | `/feature-dev` und die Refaktorisierung beschreiben |
| Schnell | `Glob("**/auth/**") + Grep("session")` parallel |

-> Empfohlen: „Methodisch" (grosse Refaktorisierung profitiert von vorheriger Planung)
```

## Voraussetzungen

- Claude Code CLI

## Lizenz

MIT © 2026 dragon1086
