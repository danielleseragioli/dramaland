

import Foundation

struct TrendingTitlesResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_title: String?
    let original_name: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Double
    let vote_count: Int
    let release_date: String?
    let title: String?




    
    
    // arrumar igual no vídeo - 1h33
//    let adult: Int
//    let backdrop_path: String?
//    let genre_ids: Int
//    let original_language: String?
//    let popularity: Double
//    let title: String?
//    let video: Int


}
