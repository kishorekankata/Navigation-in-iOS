import SwiftUI

// MARK: - 3. Alerts Demo
// HIG: Alerts communicate important information and require acknowledgment
struct AlertDemo: View {
    @State private var showInformationalAlert = false
    @State private var showDestructiveAlert = false
    @State private var showDecisionAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Alerts",
                    higNote: "HIG: 'Use alerts sparingly'",
                    description: "Alerts interrupt the user experience and should only be used for important situations like confirming destructive actions or notifying about problems.",
                    color: .red
                )

                // Informational Alert
                Button("Informational Alert") {
                    showInformationalAlert = true
                }
                .buttonStyle(.borderedProminent)
                .alert("Download Complete", isPresented: $showInformationalAlert) {
                    // HIG: Single button alerts use "OK"
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Your file has been downloaded successfully.")
                }

                // Destructive Alert
                Button("Destructive Action Alert") {
                    showDestructiveAlert = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .alert("Delete Photo?", isPresented: $showDestructiveAlert) {
                    // HIG: Destructive actions use .destructive role
                    // HIG: Cancel is automatically placed appropriately by iOS
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This photo will be deleted from all your devices.")
                }

                // Decision Alert
                Button("Decision Alert") {
                    showDecisionAlert = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .alert("Save Changes?", isPresented: $showDecisionAlert) {
                    // HIG: For 3 buttons, they stack vertically
                    Button("Save", role: .none) { }
                    Button("Don't Save", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Do you want to save your changes before closing?")
                }

                HIGGuidelinesCard(items: [
                    "Keep titles short (2-3 words ideal)",
                    "Message text should be concise",
                    "Use 'role: .destructive' for dangerous actions",
                    "Use 'role: .cancel' for safe dismissal",
                    "Limit to 2-3 buttons maximum"
                ])

                HIGNoteCard(
                    note: "HIG: iOS automatically positions buttons based on their roles. Cancel appears in a consistent location. Destructive actions appear in red."
                )
            }
            .padding()
        }
        .navigationTitle("Alerts")
        .navigationBarTitleDisplayMode(.inline)
    }
}
