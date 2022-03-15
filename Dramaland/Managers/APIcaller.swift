//
//  Get the movies that belong to a keyword
//  https://api.themoviedb.org/3/keyword/{keyword_id}/movies?api_key=d63c59d15fdc060e1c41947aa0dfc6b0
//
//  {"id":288474,"name":"based on webcomic or webtoon"}
//  {"id":267761,"name":"inter-korean relations"}
//  272050-korean-chinese
//
//  Upcoming Movies
//  https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=ko-KR&page=1
//
//  Popular Movies
//  https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=ko-KR&page=1
//
//  Top Rated Movies
//  https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=ko-KR&page=1


import Foundation

struct Constants {
    
    static let APIkey = "d63c59d15fdc060e1c41947aa0dfc6b0"
    static let baseURL = "https://api.themoviedb.org"
    static let idKeywordBasedOnWebcomicOrWebtoon = "288474"
    static let idKeywordInterKoreanRelations = "267761"
}

enum APIerror: Error{
    case failedTogetData
}

class APIcaller {
    
    
    func getMoviesFromId(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/keyword/288474/movies?api_key=\(Constants.APIkey)") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getMoviesFromIdTwo(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/keyword/267761/movies?api_key=\(Constants.APIkey)") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getMoviesFromIdThree(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/keyword/272050/movies?api_key=\(Constants.APIkey)") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
        }
        task.resume()
    }

        
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Constants.APIkey)&language=ko-KR&page=1") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
            
        }
       
        task.resume()

    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.APIkey)&language=ko-KR&page=1") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
            
        }
       
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {

        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(Constants.APIkey)&language=ko-KR&page=1") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)) { data, _, error in
        
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIerror.failedTogetData))
            }
            
        }
       
        task.resume()
    }
    
}
