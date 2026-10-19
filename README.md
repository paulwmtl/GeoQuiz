# GeoQuiz 🌍

A small iOS geography quiz app. Version 1 has an **EU flags quiz**: you see a flag and pick the right country from four options.

I built the app as a personal side project to practise native iOS development with Swift and SwiftUI. It was **built with AI-assisted coding** (Claude, Gemini). I set the product direction, structure and review, and AI tools sped up the implementation.

## Features

- 🇪🇺 **EU flags quiz** covering all 27 EU member states
- 🎲 **Randomized rounds**: 10 questions per round, each with 4 shuffled answer options
- ✅ **Instant feedback** on every answer (correct or wrong)
- 📊 **Progress bar and live score** during the round
- 🏆 **Result screen** with score, percentage and a rating, plus "play again"
- 🌙 Dark mode support and a clean, modern SwiftUI interface

## Tech stack

| Area | Technology |
|---|---|
| Language | Swift 5.9 |
| UI | SwiftUI |
| Architecture | MVVM (`QuizViewModel` with `ObservableObject` / `@Published`) |
| Platform | iOS 17+ |
| Project setup | XcodeGen (`project.yml`) |

## How it works

```
Models/        Country (name, capital, flag), QuizQuestion
ViewModels/    QuizViewModel: question generation, scoring, quiz state
Views/         ContentView (start screen), QuizView, AnswerButton, ResultView
```

For each round the `QuizViewModel` shuffles the country list and picks 10 countries. It adds 3 random wrong answers to each one and keeps track of score and progress. The views react to the published state.

## Run it locally

Requirements: macOS with Xcode 15+.

```bash
git clone https://github.com/paulwmtl/GeoQuiz.git
cd GeoQuiz
open GeoQuiz.xcodeproj
```

Choose an iPhone simulator and press **Run** (⌘R).

## Roadmap

- More quiz modes: capitals, world flags, countries on a map
- Difficulty levels and a timed mode
- High scores saved on device

## License

MIT, see [LICENSE](LICENSE).
