//
//  ParserEvalTests.swift
//  ParserEvalTests
//
//  Created by jay on 3/5/17.
//  Copyright © 2017 jay. All rights reserved.
//

import XCTest
@testable import SwiftyJSON
@testable import JJson

class ParserEvalTests: XCTestCase {
    
    var data: Data!
    
    override func setUp() {
        super.setUp()
        data = loadData(forFilename: "json")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJJsonLoads() {
        let json = JJSON(data: self.data)!
        var tracks = [PartialTrack]()
        if let results = json["results"] {
            for trackJson in results {
                tracks.append(PartialTrack(json: trackJson))
            }
        }
        XCTAssert(tracks[1].artistName! == "Beatless")
        XCTAssert(tracks[1].trackName! == "Love from the Sun")
        XCTAssert(tracks[1].trackPrice! == 0.99)
        XCTAssert(tracks[1].currency! == "USD")
    }
    
    func testSwiftyJSONLoads() {
        let json = JSON(data: self.data)
        var tracks = [PartialTrack]()
        let results = json["results"]
        for (_, subJson):(String, JSON) in results {
            tracks.append(PartialTrack(json: subJson))
        }
        XCTAssert(tracks[1].artistName! == "Beatless")
        XCTAssert(tracks[1].trackName! == "Love from the Sun")
        XCTAssert(tracks[1].trackPrice! == 0.99)
        XCTAssert(tracks[1].currency! == "USD")
    }
    
    func testJJsonConstructPerformance() {
        self.measure {
            let _ = JJSON(data: self.data)
        }
    }
    
    func testSwiftyJSONConstructPerformance() {
        self.measure {
            let _ = JSON(data: self.data)
        }
    }
    
    func testJJsonAccessPerformance() {
        let json = JJSON(data: self.data)!
        self.measure {
            var tracks = [Track]()
            if let results = json["results"] {
                for trackJson in results {
                    tracks.append(Track(json: trackJson))
                }
            }
        }
    }
    
    func testSwiftyJSONAccessPerformance() {
        let json = JSON(data: self.data)
        self.measure {
            var tracks = [Track]()
            let results = json["results"]
            for (_, subJson):(String, JSON) in results {
                tracks.append(Track(json: subJson))
            }
        }
    }
    
    func testJJsonConstructAndAccessPerformance() {
        self.measure {
            let json = JJSON(data: self.data)!
            var tracks = [Track]()
            if let results = json["results"] {
                for trackJson in results {
                    tracks.append(Track(json: trackJson))
                }
            }
        }
    }
    
    func testSwiftyJSONConstructAndAccessPerformance() {
        self.measure {
            let json = JSON(data: self.data)
            var tracks = [Track]()
            let results = json["results"]
            for (_, subJson):(String, JSON) in results {
                tracks.append(Track(json: subJson))
            }
        }
    }
    
    func testJJsonConstructAndPartialAccessPerformance() {
        self.measure {
            let json = JJSON(data: self.data)!
            var tracks = [PartialTrack]()
            if let results = json["results"] {
                for trackJson in results {
                    tracks.append(PartialTrack(json: trackJson))
                }
            }
        }
    }
    
    func testSwiftyJSONConstructAndPartialAccessPerformance() {
        self.measure {
            let json = JSON(data: self.data)
            var tracks = [PartialTrack]()
            let results = json["results"]
            for (_, subJson):(String, JSON) in results {
                tracks.append(PartialTrack(json: subJson))
            }
        }
    }
    
    func loadData(forFilename fileName: String) -> Data? {
        if let url = Bundle(for: self.classForCoder).url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                return data
            }
        }
        return nil
    }
}


struct Track {
    
    var wrapperType: String?
    var kind: String?
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool?
    
    init(json: JJSON) {
        wrapperType = json["artistName"]?.string
        kind = json["artistName"]?.string
        artistId = json["artistName"]?.int
        collectionId = json["artistName"]?.int
        trackId = json["artistName"]?.int
        artistName = json["artistName"]?.string
        collectionName = json["collectionName"]?.string
        trackName = json["trackName"]?.string
        collectionCensoredName = json["collectionCensoredName"]?.string
        trackCensoredName = json["trackCensoredName"]?.string
        artistViewUrl = json["artistViewUrl"]?.string
        collectionViewUrl = json["collectionViewUrl"]?.string
        trackViewUrl = json["trackViewUrl"]?.string
        previewUrl = json["previewUrl"]?.string
        artworkUrl30 = json["artworkUrl30"]?.string
        artworkUrl60 = json["artworkUrl60"]?.string
        artworkUrl100 = json["artworkUrl100"]?.string
        collectionPrice = json["collectionPrice"]?.double
        trackPrice = json["trackPrice"]?.double
        releaseDate = json["releaseDate"]?.string
        collectionExplicitness = json["collectionExplicitness"]?.string
        trackExplicitness = json["trackExplicitness"]?.string
        discCount = json["discCount"]?.int
        discNumber = json["discNumber"]?.int
        trackCount = json["trackCount"]?.int
        trackNumber = json["trackNumber"]?.int
        trackTimeMillis = json["trackTimeMillis"]?.int
        country = json["country"]?.string
        currency = json["currency"]?.string
        primaryGenreName = json["primaryGenreName"]?.string
        isStreamable = json["isStreamable"]?.bool
    }
    
    init(json: JSON) {
        wrapperType = json["artistName"].string
        kind = json["artistName"].string
        artistId = json["artistName"].int
        collectionId = json["artistName"].int
        trackId = json["artistName"].int
        artistName = json["artistName"].string
        collectionName = json["collectionName"].string
        trackName = json["trackName"].string
        collectionCensoredName = json["collectionCensoredName"].string
        trackCensoredName = json["trackCensoredName"].string
        artistViewUrl = json["artistViewUrl"].string
        collectionViewUrl = json["collectionViewUrl"].string
        trackViewUrl = json["trackViewUrl"].string
        previewUrl = json["previewUrl"].string
        artworkUrl30 = json["artworkUrl30"].string
        artworkUrl60 = json["artworkUrl60"].string
        artworkUrl100 = json["artworkUrl100"].string
        collectionPrice = json["collectionPrice"].double
        trackPrice = json["trackPrice"].double
        releaseDate = json["releaseDate"].string
        collectionExplicitness = json["collectionExplicitness"].string
        trackExplicitness = json["trackExplicitness"].string
        discCount = json["discCount"].int
        discNumber = json["discNumber"].int
        trackCount = json["trackCount"].int
        trackNumber = json["trackNumber"].int
        trackTimeMillis = json["trackTimeMillis"].int
        country = json["country"].string
        currency = json["currency"].string
        primaryGenreName = json["primaryGenreName"].string
        isStreamable = json["isStreamable"].bool
    }
}


struct PartialTrack {
    
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var currency: String?
    var primaryGenreName: String?
    
    init(json: JJSON) {
        artistName = json["artistName"]?.string
        collectionName = json["collectionName"]?.string
        trackName = json["trackName"]?.string
        collectionPrice = json["collectionPrice"]?.double
        trackPrice = json["trackPrice"]?.double
        currency = json["currency"]?.string
        primaryGenreName = json["primaryGenreName"]?.string
    }
    
    init(json: JSON) {
        artistName = json["artistName"].string
        collectionName = json["collectionName"].string
        trackName = json["trackName"].string
        collectionPrice = json["collectionPrice"].double
        trackPrice = json["trackPrice"].double
        currency = json["currency"].string
        primaryGenreName = json["primaryGenreName"].string
    }
}



