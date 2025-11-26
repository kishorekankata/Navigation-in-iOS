import SwiftUI

// MARK: - 4. Confirmation Dialogs Demo
// HIG: Called "Action Sheets" on iPhone, "Popovers" on iPad
struct ConfirmationDialogDemo: View {
    @State private var showConfirmationDialog = false
    @State private var showDestructiveDialog = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Confirmation Dialogs",
                    higNote: "HIG: 'Action Sheets' (iPhone) / 'Popovers' (iPad)",
                    description: "Present a set of choices related to an action. On iPhone, appears from bottom. On iPad, appears as a popover near the trigger.",
                    color: .orange
                )

                Button("Show Options") {
                    showConfirmationDialog = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .confirmationDialog(
                    "Share Photo",
                    isPresented: $showConfirmationDialog,
                    titleVisibility: .visible
                ) {
                    Button("Copy Link") { }
                    Button("Share via Messages") { }
                    Button("Share via Email") { }
                    Button("Save to Files") { }
                    // HIG: Cancel is automatically added at bottom
                } message: {
                    Text("Choose how you'd like to share this photo")
                }

                Button("Destructive Options") {
                    showDestructiveDialog = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .confirmationDialog(
                    "Delete Item",
                    isPresented: $showDestructiveDialog,
                    titleVisibility: .visible
                ) {
                    // HIG: Destructive option appears in red
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This action cannot be undone.")
                }

                HIGGuidelinesCard(items: [
                    "Use for 3+ related options",
                    "Cancel is automatically added by iOS",
                    "Destructive actions appear in red at top",
                    "On iPad, appears as popover (attach to source)",
                    "Don't use for simple yes/no (use Alert instead)"
                ])

                ExamplesCard(apps: [
                    "Photos app share sheet",
                    "Safari download options",
                    "Notes more options menu"
                ])
            }
            .padding()
        }
        .navigationTitle("Confirmation Dialogs")
        .navigationBarTitleDisplayMode(.inline)
    }
}
