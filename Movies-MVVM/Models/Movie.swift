//
//  Movies.swift
//
//  Created by Aya Essam on 9/26/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Movie: Codable {

  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
    case id
    case overview
    case originalLanguage = "original_language"
    case popularity
    case releaseDate = "release_date"
    case genreIds = "genre_ids"
    case title
    case voteCount = "vote_count"
    case video
    case originalTitle = "original_title"
    case voteAverage = "vote_average"
  }

  var adult: Bool?
  var backdropPath: String?
  var posterPath: String?
  var id: Int?
  var overview: String?
  var originalLanguage: String?
  var popularity: Float?
  var releaseDate: String?
  var genreIds: [Int]?
  var title: String?
  var voteCount: Int?
  var video: Bool?
  var originalTitle: String?
  var voteAverage: Float?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
  }

}
