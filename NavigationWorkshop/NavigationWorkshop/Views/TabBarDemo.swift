import SwiftUI

// MARK: - 6. Tab Bars Demo
// HIG: Tab bars provide flat navigation between top-level sections
struct TabBarDemo: View {
    @State private var selectedTab = 0
    @State private var messagesBadge = 3

    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1: Home
            TabContentView(
                title: "Tab Bars",
                icon: "house.fill",
                description: "Tab bars organize content at the app's top level. Each tab represents a distinct section of your app.",
                guidelines: [
                    "Limit to 5 tabs maximum",
                    "Use filled SF Symbols for selected state",
                    "Each tab maintains its own navigation state",
                    "Don't hide tab bar during navigation",
                    "Tabs should represent parallel content areas"
                ]
            )
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)

            // Tab 2: With Badge
            NavigationStack {
                VStack(spacing: 20) {
                    Text("Messages Tab")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("This tab shows a badge. Badges indicate new content or pending items.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    HIGNoteCard(
                        note: "HIG: Use badges sparingly. They're for counts or status indicators, not promotional content."
                    )

                    Button("Clear Badge") {
                        messagesBadge = 0
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                .navigationTitle("Messages")
            }
            .tabItem {
                Label("Messages", systemImage: "message.fill")
            }
            // HIG: Badges show unread counts or status
            .badge(messagesBadge)
            .tag(1)

            // Tab 3: With its own navigation
            NavigationStack {
                VStack(spacing: 20) {
                    Text("Search Tab")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Each tab can have its own NavigationStack. Push/pop works independently per tab.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    NavigationLink("Push a Detail View") {
                        Text("Detail in Search tab")
                            .navigationTitle("Search Detail")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .navigationTitle("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(2)

            // Tab 4: Profile
            NavigationStack {
                VStack(spacing: 20) {
                    Text("Profile Tab")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Switching tabs preserves each tab's navigation state.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
                .padding()
                .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(3)
        }
    }
}

struct TabContentView: View {
    let title: String
    let icon: String
    let description: String
    let guidelines: [String]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HIGInfoCard(
                        title: title,
                        higNote: "HIG: 'Flat navigation between app sections'",
                        description: description,
                        color: .blue
                    )

                    HIGGuidelinesCard(items: guidelines)

                    ExamplesCard(apps: [
                        "App Store (Today, Games, Apps, Arcade, Search)",
                        "Music (Listen Now, Browse, Radio, Library, Search)",
                        "Photos (Library, For You, Albums, Search)"
                    ])
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}
