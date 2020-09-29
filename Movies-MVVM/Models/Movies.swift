//
//  Movies.swift
//
//  Created by Aya Essam on 9/26/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Movies: Codable {

  enum CodingKeys: String, CodingKey {
    case totalPages = "total_pages"
    case results
    case page
    case totalResults = "total_results"
  }

  var totalPages: Int?
  var results: [Results]?
  var page: Int?
  var totalResults: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    results = try container.decodeIfPresent([Results].self, forKey: .results)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
  }

}
