//
//  Readme.md
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/25/25.
//



# ScoreTracker

ScoreTracker is a SwiftUI-based app that displays football standings, top scorers, and other competition data using [XCAFootballDataClient](https://github.com/alfianlosari/XCAFootballDataClient). It supports both iOS and visionOS with immersive RealityKit-based views for spatial experiences.

---

## Features

- Display league standings in a native SwiftUI `Table`
- Show top scorers with club crests
- Beautiful data tables for wins, draws, losses, and goals
- visionOS integration using RealityKit and RealityView
- Modular architecture using Swift Packages

---

##  Dependencies

This app uses the following packages:

| Package                 | Description |
|-------------------------|-------------|
| `XCAFootballDataClient` | REST client for football data |
| `SVGImageSwiftUI`       | Renders SVG images like club logos |
| `RealityKitContent`     | Local Swift Package auto-generated Xcode by                                     visionOS template for RealityView scenes |

---

##  Requirements

- **Xcode 15.3+**
- **Swift 5.10+**
- **iOS 17+**
- **visionOS 1.0+**
- Internet access for live API data

---

##  Project Structure

```

ScoreTracker/
├── ScoreTracker.xcodeproj/
├── ScoreTracker/
│   ├── Views/
│   ├── Models/
│   ├── ViewModels/
│   └── Assets/
├── Packages/
│   └── RealityKitContent/
└── Package Dependencies
├── XCAFootballDataClient
└── SVGImageSwiftUI

````

---

##  Setup Instructions

### Step 1: Clone the Project

```bash
git clone https://github.com/yourusername/ScoreTracker.git
cd ScoreTracker
open ScoreTracker.xcodeproj
````

### Step 2: Add Swift Packages

Go to **File ▸ Swift Packages ▸ Add Package Dependency...**, and add the following:

####  `XCAFootballDataClient`

```
https://github.com/alfianlosari/XCAFootballDataClient
```

####  `SVGImageSwiftUI`

```
https://github.com/alfianlosari/SVGImageSwiftUI
```

### Step 3: Add `RealityKitContent` (if building for visionOS)

1. Go to `File ▸ Swift Packages ▸ Add Local Package...`
2. Choose the `Packages/RealityKitContent` folder
3. Ensure it's listed under “Frameworks, Libraries & Embedded Content”


## 📸 Screenshots

> Add screenshots of the Standings and Top Scorers tables here (iOS and visionOS)

---

