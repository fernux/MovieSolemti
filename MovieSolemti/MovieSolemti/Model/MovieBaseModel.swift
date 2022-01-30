//
//  MovieBaseModel.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 28/01/22.
//

import Foundation

struct MovieBaseModel : Codable {
    let results : [Results]?
    let page : Int?
    let total_results : Int?
    let dates : Dates?
    let total_pages : Int?

    enum CodingKeys: String, CodingKey {

        case results = "results"
        case page = "page"
        case total_results = "total_results"
        case dates = "dates"
        case total_pages = "total_pages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        dates = try values.decodeIfPresent(Dates.self, forKey: .dates)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
    }

}


struct Results : Codable, Hashable {
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let poster_path : String?
    let id : Int?
    let adult : Bool?
    let backdrop_path : String?
    let original_language : String?
    let original_name : String?
    let genre_ids : [Int]?
    let name : String?
    let vote_average : Double?
    let overview : String?
    let first_air_date : String?

    enum CodingKeys: String, CodingKey {

        case popularity = "popularity"
        case vote_count = "vote_count"
        case video = "video"
        case poster_path = "poster_path"
        case id = "id"
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case original_language = "original_language"
        case original_name = "original_name"
        case genre_ids = "genre_ids"
        case name = "name"
        case vote_average = "vote_average"
        case overview = "overview"
        case first_air_date = "first_air_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        first_air_date = try values.decodeIfPresent(String.self, forKey: .first_air_date)
    }

}


struct Dates : Codable {
    let maximum : String?
    let minimum : String?

    enum CodingKeys: String, CodingKey {

        case maximum = "maximum"
        case minimum = "minimum"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maximum = try values.decodeIfPresent(String.self, forKey: .maximum)
        minimum = try values.decodeIfPresent(String.self, forKey: .minimum)
    }

}
    
