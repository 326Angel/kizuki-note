import SwiftUI
import SwiftData

struct MemoInputView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var memoText = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $memoText)
                    .padding()

                Button("Save") {
                    guard !memoText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                    modelContext.insert(Memo(text: memoText))
                    memoText = ""
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Kizuki")
        }
    }
}
