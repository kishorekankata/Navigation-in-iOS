# Navigation in iOS

A SwiftUI workshop project demonstrating various iOS navigation patterns following Apple Human Interface Guidelines (HIG).

## Overview

This project showcases the different navigation patterns available in iOS/SwiftUI, providing interactive demos and examples for each approach.

## Navigation Patterns

| Pattern | Description |
|---------|-------------|
| **Hierarchical Navigation** | Push/pop stack-based navigation using `NavigationStack` |
| **Modal Presentations** | Overlay sheets for focused tasks |
| **Alerts** | System alerts for important messages |
| **Confirmation Dialogs** | Action sheets for user confirmations |
| **Popovers** | Contextual floating views (iPad-optimized) |
| **Tab Bars** | Top-level app section switching |
| **Sheet Detents** | Resizable bottom sheets (iOS 16+) |

## Demos

| Hierarchical Navigation | Modal/Overlay | Alerts |
|:-----------------------:|:-------------:|:------:|
| ![Hierarchical](Demo/Stack%20or%20Hierarchical%20Navigation.gif) | ![Modal](Demo/Modal%20or%20overlay.gif) | ![Alerts](Demo/Alerts.gif) |

| Confirmation Dialogs | Popovers | Tab Bars |
|:--------------------:|:--------:|:--------:|
| ![Confirmation](Demo/Confirmation%20dialogs.gif) | ![Popovers](Demo/Popovers.gif) | ![Tabs](Demo/Tab%20bars.gif) |

| Sheets with Detents |
|:-------------------:|
| ![Detents](Demo/Sheets%20with%20Detents.gif) |

## Requirements

- iOS 16.0+
- Xcode 14+
- Swift 5.7+

## Project Structure

```
NavigationWorkshop/
├── NavigationWorkshopApp.swift
└── Views/
    ├── ContentView.swift
    ├── HierarchicalNavigationDemo.swift
    ├── ModalPresentationDemo.swift
    ├── AlertDemo.swift
    ├── ConfirmationDialogDemo.swift
    ├── PopoverDemo.swift
    ├── TabBarDemo.swift
    ├── SheetDetentsDemo.swift
    └── HIGHelperViews.swift
```

## License

MIT
