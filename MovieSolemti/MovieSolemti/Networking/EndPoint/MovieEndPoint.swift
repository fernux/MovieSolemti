//
//  NovieEndPoint.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 28/01/22.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum MovieApi {
    case popular
    case topRated
    case onTheAir
    case airingToday
    case movieDetail(movieId:Int)
    case searchMovie(searchKey:String)
}

extension MovieApi: EndPointType {

    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.themoviedb.org/3/movie/"
        case .qa: return "https://qa.themoviedb.org/3/tv/"
        case .staging: return "https://api.themoviedb.org/3"
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .popular:
            return "/tv/popular"
        case .topRated:
            return "/tv/top_rated"
        case .onTheAir:
            return "/tv/on_the_air"
        case .airingToday:
            return "/tv/airing_today"
        case .movieDetail(let movieId) :
            return "/tv/\(movieId)"
        case .searchMovie :
            return "/search/tv"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .popular:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false
                                      ])
        case .topRated :
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false])
        case .onTheAir :
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false])
        case .airingToday :
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false])
        case .movieDetail :
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false])
        case .searchMovie(let searchKey):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":Config.movieDBAPIKey,
                                                      "language" : Config.language_EN,
                                                      "adult" : false,
                                                      "query" : searchKey])
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}


