import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MemoInputView()
                .tabItem {
                    Label("Capture", systemImage: "square.and.pencil")
                }

            MemoListView()
                .tabItem {
                    Label("Notes", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
