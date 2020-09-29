//
//  Results.swift
//
//  Created by Aya Essam on 9/26/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Results: Codable {

  enum CodingKeys: String, CodingKey {
    case video
    case releaseDate = "release_date"
    case adult
    case posterPath = "poster_path"
    case popularity
    case backdropPath = "backdrop_path"
    case overview
    case voteAverage = "vote_average"
    case originalLanguage = "original_language"
    case title
    case genreIds = "genre_ids"
    case voteCount = "vote_count"
    case id
    case originalTitle = "original_title"
  }

  var video: Bool?
  var releaseDate: String?
  var adult: Bool?
  var posterPath: String?
  var popularity: Float?
  var backdropPath: String?
  var overview: String?
  var voteAverage: Float?
  var originalLanguage: String?
  var title: String?
  var genreIds: [Int]?
  var voteCount: Int?
  var id: Int?
  var originalTitle: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
  }

}
