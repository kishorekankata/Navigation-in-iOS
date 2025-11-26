import SwiftUI

// MARK: - 1. Hierarchical Navigation Demo
// HIG: "Hierarchical navigation" is Apple's official term for push/pop
struct HierarchicalNavigationDemo: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Hierarchical Navigation",
                    higNote: "HIG Term: 'Hierarchical' or 'Drill-down' navigation",
                    description: "People navigate by making one choice per screen until they reach a destination. To go to another destination, they retrace their steps or start over.",
                    color: .blue
                )

                NavigationLink("Navigate to Level 2") {
                    HierarchicalLevel2()
                }
                .buttonStyle(.borderedProminent)

                HIGGuidelinesCard(items: [
                    "Use for content with clear hierarchy",
                    "Back button automatically shows previous title",
                    "Support swipe-from-edge gesture (built-in)",
                    "Use inline title for child screens",
                    "Large title only for top-level screens"
                ])

                ExamplesCard(apps: [
                    "Settings app (Settings → General → About)",
                    "Mail app (Inbox → Message → Attachment)",
                    "Files app (Browse → Folder → File)"
                ])
            }
            .padding()
        }
        // HIG: Child views should use inline titles
        .navigationTitle("Hierarchical")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HierarchicalLevel2: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Level 2")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Notice the back button shows 'Hierarchical' - the previous screen's title")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                NavigationLink("Navigate to Level 3") {
                    HierarchicalLevel3()
                }
                .buttonStyle(.borderedProminent)

                HIGNoteCard(
                    note: "HIG: The back button label should be the title of the previous screen. If the title is too long, iOS automatically replaces it with 'Back'."
                )
            }
            .padding()
        }
        .navigationTitle("Level 2")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HierarchicalLevel3: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Level 3 - Deepest Level")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("You're 3 levels deep. Users can:")
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Label("Tap back button", systemImage: "chevron.left")
                    Label("Swipe from left edge", systemImage: "hand.draw")
                    Label("Long-press back for history", systemImage: "list.bullet")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                // HIG: You can programmatically dismiss using environment
                Button("Programmatic Pop (dismiss)") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .navigationTitle("Level 3")
        .navigationBarTitleDisplayMode(.inline)
    }
}
