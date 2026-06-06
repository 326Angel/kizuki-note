import SwiftUI
import SwiftData

struct MemoDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var memo: Memo
    @State private var showDeleteConfirmation = false

    var body: some View {
        VStack {
            TextEditor(text: $memo.text)
                .padding()
        }
        .navigationTitle("Edit")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(role: .destructive) {
                    showDeleteConfirmation = true
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    memo.updatedAt = Date()
                    dismiss()
                }
            }
        }
        .confirmationDialog("Delete this note?", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                modelContext.delete(memo)
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}
