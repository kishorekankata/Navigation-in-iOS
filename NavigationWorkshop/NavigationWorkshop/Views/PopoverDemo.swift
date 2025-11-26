import SwiftUI

// MARK: - 5. Popovers Demo
// HIG: Popovers are for transient views that appear above other content
struct PopoverDemo: View {
    @State private var showPopover = false
    @State private var showMenuPopover = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Popovers",
                    higNote: "HIG: Best suited for iPad; adapt on iPhone",
                    description: "Transient views that appear above other content, anchored to a source element. On iPhone, they typically adapt to sheets unless overridden.",
                    color: .green
                )

                Button("Show Info Popover") {
                    showPopover = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .popover(isPresented: $showPopover, arrowEdge: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Popover Content", systemImage: "info.circle.fill")
                            .font(.headline)

                        Text("This popover points to its source. On iPad, it appears as a true popover. On iPhone, it adapts to a sheet by default.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Divider()

                        Button("Got It") {
                            showPopover = false
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                    }
                    .padding()
                    .frame(width: 280)
                    // HIG: Force popover on iPhone if appropriate
                    .presentationCompactAdaptation(.popover)
                }

                Button("Menu-Style Popover") {
                    showMenuPopover = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.teal)
                .popover(isPresented: $showMenuPopover, arrowEdge: .top) {
                    VStack(spacing: 0) {
                        ForEach(["Edit", "Duplicate", "Move", "Share"], id: \.self) { item in
                            Button {
                                showMenuPopover = false
                            } label: {
                                HStack {
                                    Text(item)
                                    Spacer()
                                    Image(systemName: iconFor(item))
                                }
                                .padding()
                            }
                            .foregroundStyle(.primary)

                            if item != "Share" {
                                Divider()
                            }
                        }
                    }
                    .frame(width: 200)
                    .presentationCompactAdaptation(.popover)
                }

                HIGGuidelinesCard(items: [
                    "Arrow should point to source element",
                    "Dismiss by tapping outside",
                    "Use .presentationCompactAdaptation for iPhone behavior",
                    "Keep content focused and brief",
                    "Avoid critical actions (user might miss them)"
                ])

                HIGNoteCard(
                    note: "HIG: On iPhone, consider using a confirmation dialog or sheet instead of a popover for better usability."
                )
            }
            .padding()
        }
        .navigationTitle("Popovers")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func iconFor(_ item: String) -> String {
        switch item {
        case "Edit": return "pencil"
        case "Duplicate": return "doc.on.doc"
        case "Move": return "folder"
        case "Share": return "square.and.arrow.up"
        default: return "circle"
        }
    }
}
