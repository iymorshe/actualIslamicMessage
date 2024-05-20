import Foundation

struct Ayah: Decodable, Hashable {
    let numberInSurah: Int
    let number:Int
    let text: String
    
    // Implementing Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(numberInSurah)
//    }
//
//    static func == (lhs: Ayah, rhs: Ayah) -> Bool {
//        return lhs.numberInSurah == rhs.numberInSurah
//    }
}

struct Surah: Decodable {
    let number: Int
    let ayahs: [Ayah]
}

struct QuranData: Decodable {
    let surahs: [Surah]
}

struct QuranResponse: Decodable {
    let data: QuranData
}
enum QuranError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

func fetchQuran() async throws -> [Ayah] {
    let urlString = "https://api.alquran.cloud/v1/quran/en.hilali"
    guard let url = URL(string: urlString) else {
        throw QuranError.invalidURL
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(QuranResponse.self, from: data)
        
        // We will flatten the list of ayahs from all surahs into a single array
        return decodedData.data.surahs.flatMap { surah in
            surah.ayahs.map { ayah in
                Ayah(numberInSurah: ayah.numberInSurah, number: ayah.number, text: ayah.text)
            }
        }
    } catch let error as DecodingError {
        throw QuranError.decodingError(error)
    } catch {
        throw QuranError.networkError(error)
    }
}
