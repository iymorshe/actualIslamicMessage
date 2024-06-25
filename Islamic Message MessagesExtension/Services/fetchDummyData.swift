//import Foundation
//
//func fetchAyahModels(completion: @escaping ([FetchedAyahModel]?, Error?) -> Void) {
//    var fetchedAyahModels: [FetchedAyahModel] = []
//    
//    for i in 1...7 {
//        do {
//            fetchAyah(verseID: i, chapterID: 1) { ayahModel, error in
//                if let ayahModel = ayahModel {
//                    fetchedAyahModels.append(ayahModel)
//                } else if let error = error {
//                    completion(nil, error)
//                    return
//                }
//                
//                if fetchedAyahModels.count == 7 {
//                    completion(fetchedAyahModels, nil)
//                }
//            }
//        }
//    }
//}
