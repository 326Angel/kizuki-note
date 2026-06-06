import SwiftUI
import SwiftData

struct MemoListView: View {
    @Query(sort: \Memo.createdAt, order: .reverse) private var memos: [Memo]
    @State private var searchText = ""

    var filteredMemos: [Memo] {
        searchText.isEmpty ? memos : memos.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List(filteredMemos) { memo in
                NavigationLink(destination: MemoDetailView(memo: memo)) {
                    Text(memo.text)
                        .lineLimit(2)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Notes")
        }
    }
}
