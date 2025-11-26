import SwiftUI

// MARK: - 2. Modal Presentations Demo
// HIG: Modality should be used sparingly and only when focus is required
struct ModalPresentationDemo: View {
    @State private var showSheet = false
    @State private var showFullScreenCover = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HIGInfoCard(
                    title: "Modal Presentations",
                    higNote: "HIG: 'Use modality only when focus is required'",
                    description: "Modality creates focus by preventing interaction with other views until the modal task is completed or dismissed.",
                    color: .purple
                )

                // Sheet (Default Modal)
                Button("Present Sheet") {
                    showSheet = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .sheet(isPresented: $showSheet) {
                    SheetContentView(dismiss: { showSheet = false })
                }

                // Full Screen Cover
                Button("Present Full Screen Cover") {
                    showFullScreenCover = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .fullScreenCover(isPresented: $showFullScreenCover) {
                    FullScreenCoverContent(dismiss: { showFullScreenCover = false })
                }

                HIGGuidelinesCard(items: [
                    "Sheet: Default. Shows card over content. Swipe to dismiss.",
                    "Full Screen: Use for immersive tasks (camera, media playback)",
                    "Always provide explicit dismiss (Cancel/Done/Close)",
                    "Don't stack modals - avoid modal-over-modal",
                    "Return user to exact previous state on dismiss"
                ])

                HIGNoteCard(
                    note: "HIG: When possible, include a button that dismisses the modal view. A sheet should include a grabber (iOS adds automatically) to indicate it can be swiped down."
                )
            }
            .padding()
        }
        .navigationTitle("Modals")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SheetContentView: View {
    let dismiss: () -> Void
    @State private var text = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("This is a Sheet")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Sheets appear as cards that partially cover the underlying content. Users can swipe down to dismiss.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                // HIG: Sheets often contain forms or creation flows
                TextField("Example input field", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 40)
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // HIG: Cancel on leading, primary action on trailing
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
        }
        // HIG: Prevents accidental dismiss when there's user input
        .interactiveDismissDisabled(!text.isEmpty)
    }
}

struct FullScreenCoverContent: View {
    let dismiss: () -> Void

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "camera.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.indigo)

                Text("Full Screen Cover")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Use for immersive experiences like camera, media playback, or onboarding flows that require full attention.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 60)
            .toolbar {
                // HIG: Close button for full screen covers
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}
