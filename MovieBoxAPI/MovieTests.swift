//
//  MovieTests.swift
//  MovieBoxAPITests
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

import XCTest
@testable import MovieBoxAPI

final class MovieTests: XCTestCase {

    func testParsing() throws {
        // Testlerin çalıştığı bundle'ı alıyoruz. Bu, test kaynaklarına erişim sağlar.
        let bundle = Bundle(for: MovieTests.self)
        // "movie.json" dosyasının URL'sini alıyoruz. Bu dosya testlerin bundle'ında bulunuyor.
        let url = bundle.url(forResource: "movie", withExtension: "json")!
        // URL'den veriyi okuyoruz.
        let data = try Data(contentsOf: url)
        // JSON verisini `Movie` modeline dönüştürüyoruz.
        let decoder = Decoders.plainDataDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        // Elde edilen verileri test ediyoruz.
        print(movie)
        
        XCTAssertEqual(movie.artistName, "Sabrina Carpenter")
        XCTAssertEqual(movie.name, "Short n' Sweet")
        XCTAssertEqual(movie.contentAdvisoryRating, "Explict")
        XCTAssertEqual(movie.genres?.count, 2)
        XCTAssertEqual(movie.genres?.first?.name, "Pop")
    }
}


//{
//                "artistName": "Sabrina Carpenter",
//                "id": "1750307020",
//                "name": "Short n' Sweet",
//                "releaseDate": "2024-08-23",
//                "kind": "albums",
//                "artistId": "390647681",
//                "artistUrl": "https://music.apple.com/us/artist/sabrina-carpenter/390647681",
//                "contentAdvisoryRating": "Explict",
//                "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/f6/15/d0/f615d0ab-e0c4-575d-907e-1cc084642357/24UMGIM61704.rgb.jpg/100x100bb.jpg",
//                "genres": [
//                    {
//                        "genreId": "14",
//                        "name": "Pop",
//                        "url": "https://itunes.apple.com/us/genre/id14"
//                    },
//                    {
//                        "genreId": "34",
//                        "name": "Music",
//                        "url": "https://itunes.apple.com/us/genre/id34"
//                    }
//                ],
//                "url": "https://music.apple.com/us/album/short-n-sweet/1750307020"
// }

