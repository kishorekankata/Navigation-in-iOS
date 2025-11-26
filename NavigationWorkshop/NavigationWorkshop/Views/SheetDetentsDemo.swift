import SwiftUI

// MARK: - 7. Sheet Detents Demo (iOS 16+)
// HIG: Use detents for sheets that need multiple height options
struct SheetDetentsDemo: View {
    @State private var showDetentSheet = false
    @State private var selectedDetent: PresentationDetent = .medium

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Sheet Detents",
                    higNote: "HIG: iOS 16+ feature for resizable sheets",
                    description: "Detents allow sheets to stop at specific heights. Users can drag between detents. Common in Maps, Find My, and other Apple apps.",
                    color: .indigo
                )

                Button("Show Resizable Sheet") {
                    showDetentSheet = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .sheet(isPresented: $showDetentSheet) {
                    DetentSheetContent()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                        .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                }

                HIGGuidelinesCard(items: [
                    ".medium: ~half screen height",
                    ".large: ~full screen height",
                    ".fraction(0.25): Custom fraction of screen",
                    ".height(200): Specific point height",
                    "Show drag indicator for resizable sheets"
                ])

                HIGNoteCard(
                    note: "HIG: Use .presentationBackgroundInteraction(.enabled) to allow interaction with content behind the sheet (like Maps does)."
                )

                ExamplesCard(apps: [
                    "Maps (search results sheet)",
                    "Find My (people/device info)",
                    "Stocks (stock detail sheet)"
                ])
            }
            .padding()
        }
        .navigationTitle("Sheet Detents")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetentSheetContent: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Resizable Sheet")
                .font(.headline)
                .padding(.top, 20)

            Text("Drag up or down to resize. This sheet can stop at medium (half) or large (full) heights.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Divider()

            List {
                ForEach(1...10, id: \.self) { index in
                    Label("List Item \(index)", systemImage: "star.fill")
                }
            }
            .listStyle(.plain)
        }
    }
}
