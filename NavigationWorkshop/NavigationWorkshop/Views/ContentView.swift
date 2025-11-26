import SwiftUI

// MARK: - Main Menu
// HIG: Use NavigationStack (iOS 16+) instead of deprecated NavigationView
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("1. Hierarchical Navigation (Push/Pop)") {
                        HierarchicalNavigationDemo()
                    }

                    NavigationLink("2. Modal Presentations") {
                        ModalPresentationDemo()
                    }

                    NavigationLink("3. Alerts") {
                        AlertDemo()
                    }

                    NavigationLink("4. Confirmation Dialogs") {
                        ConfirmationDialogDemo()
                    }

                    NavigationLink("5. Popovers") {
                        PopoverDemo()
                    }

                    NavigationLink("6. Tab Bars") {
                        TabBarDemo()
                    }

                    NavigationLink("7. Sheets with Detents") {
                        SheetDetentsDemo()
                    }
                } header: {
                    Text("Navigation Patterns")
                } footer: {
                    Text("All patterns follow Apple Human Interface Guidelines (HIG)")
                }
            }
            // HIG: Top-level views should use large titles
            .navigationTitle("Navigation Workshop")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
