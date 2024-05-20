import SwiftUI
import CoreData
import Messages
import Foundation
class Ayahs: ObservableObject {
    static let shared = Ayahs()
    private init() {
        
       
    }
    @Published var ayahss: [Ayah] = []
}
    struct IslamicView: View {
        @Environment(\.managedObjectContext) var moc
        @State private var selection = 0
        @ObservedObject var ayahs: Ayahs = Ayahs.shared
        var viewSize: MSMessagesAppPresentationStyle
        var activeSession: MSConversation?
        var body: some View {
            ScrollView{
                LazyVStack{
                    if ayahs.ayahss.count == 0 {
                        ProgressView()
                    } else {
                        ForEach(0..<6236) { i in
                            AyahCell(favorited: false, ayah: ayahs.ayahss[i],activeSession: activeSession)
                        }
                    }
                    
                }
            }
            //        TabView(selection: $selection) {
            //            BoilerPlate()
            //                .tabItem {
            //                    Image(systemName: "house.fill")
            //                    Text("All Verses")
            //                }
            //                .tag(0)
            //                        BoilerPlate1()
            //                            .tabItem {
            //                                Image(systemName: "star.fill")
            //                                Text("Favorites")
            //                            }
            //                            .tag(1)
            
            
            
            
            //https://api.alquran.cloud/v1/ayah/262/en.asad
            .onAppear {
                if ayahs.ayahss.count == 0 {
                    Task {
                        do {
                            ayahs.ayahss = try await fetchQuran()
                            print("Successfully fetched ayahs")
                        } catch {
                            print("An error occurred: \(error)")
                        }
                    }
                }
            }
            
        }
        
        
        
    }
