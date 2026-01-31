# 🧭 Tool Advisor

[English](./README.md) | [한국어](./README.ko.md) | [日本語](./README.ja.md) | [中文](./README.zh-CN.md) | [Español](./README.es.md) | [Português](./README.pt-BR.md) | [Русский](./README.ru.md) | **Français** | [Deutsch](./README.de.md)

**Arrêtez de deviner quel outil utiliser. Laissez Claude Code décider.**

Tool Advisor analyse votre prompt et recommande la combinaison optimale d'outils, d'agents, de serveurs MCP et de patterns d'orchestration — avec des **commandes prêtes à copier-coller** que vous pouvez exécuter immédiatement.

![Demo](./assets/demo.gif)

## Installation

**Option 1 : Installation en une ligne**
```bash
curl -fsSL https://raw.githubusercontent.com/dragon1086/claude-skills/main/install.sh | bash
```

**Option 2 : Via [skills.sh](https://skills.sh)**
```bash
npx skills add dragon1086/claude-skills
```

Pour mettre à jour, exécutez la même commande à nouveau.

## Utilisation

Demandez simplement naturellement :

```
"Analyse avec tool-advisor : refactoriser le module d'authentification"
"tool-advisor, comment devrais-je aborder cette migration de base de données ?"
"Quelle est la meilleure approche pour implémenter l'authentification utilisateur ?"
```

La skill s'active lorsque vous mentionnez **tool-advisor** ou demandez des recommandations d'outils.

## Comment ça marche

```
Votre Prompt
    ↓
┌─────────────────────────────────┐
│        Tool Advisor             │
├─────────────────────────────────┤
│ 1. Vérifier l'inventaire local  │
│ 2. Évaluer la complexité        │
│ 3. Détecter le besoin de harness│
│ 4. Recommander plan mode ?      │
│ 5. Sélectionner agents (3 niv.) │
│ 6. Vérifier les besoins MCP     │
│ 7. Suggérer l'installation      │
│ 8. Table d'Action Rapide        │
└─────────────────────────────────┘
    ↓
🎯 Commandes prêtes à copier-coller
```

## Fonctionnalités

| Fonctionnalité | Description |
|----------------|-------------|
| **Table d'Action Rapide** | Commandes à copier-coller pour exécution immédiate |
| **Détection Plan Mode** | Recommande `EnterPlanMode` pour les tâches complexes |
| **Patterns Harness** | Détecte "jusqu'à ce que", "continuer d'essayer" → pattern Ralph |
| **Recherche d'Agents 3 Niveaux** | Intégré → Local personnalisé → Marketplace |
| **Recommandation MCP** | Affiche le statut d'installation (✅/❌) avec alternatives |
| **Human-in-the-loop** | N'installe jamais sans votre approbation |

## Exemple

**Entrée :**
```
Analyse avec tool-advisor : Refactoriser le module auth pour utiliser les tokens JWT
```

**Sortie :**
```markdown
## Résultat de l'Analyse

### 1. Classification
- Type : Refactorisation/Architecture
- Complexité : Complexe (5+ fichiers)

### 2. Harness
- Requis : Non

### 3. Plan Mode
- Recommandé : Oui
- Raison : Fichiers multiples, sensible à la sécurité

### 4. Agent
- feature-dev (installé)
- backend-developer (agent local)
- security-engineer (agent local)

### 5. Recommandation
Utiliser /feature-dev avec Plan Mode

---

## 🎯 Action Rapide

| Votre situation | Copier-coller |
|-----------------|---------------|
| D'abord planifier | `Planifie le refactoring JWT` |
| Développement guidé | `/feature-dev` |
| Fais-le simplement | `Refactorise auth pour utiliser JWT` |

→ Recommandé : "D'abord planifier" (5+ fichiers, sensible à la sécurité)
```

## Prérequis

- Claude Code CLI

## Licence

MIT © 2026 dragon1086
