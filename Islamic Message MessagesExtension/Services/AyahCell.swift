import SwiftUI
import Messages
import CoreData
struct AyahCell: View {
    @State var favorited: Bool
    let ayah: Ayah
    var activeSession: MSConversation?
    var body: some View {
        HStack {
            VStack(alignment:.leading){
                Text("\(ayah.text.split(separator: " ").prefix(7).joined(separator: " "))...")
            }
            
            .onTapGesture {
                activeSession?.insertText(ayah.text)
            }
            
            Spacer() // Added Spacer to push the Image to the right
            Text("\(findSurahIndex(for: ayah.number ) ?? -1):\(ayah.numberInSurah)")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .frame(alignment: .leading)
        }
    }
}
