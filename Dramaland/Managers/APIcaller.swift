
import Foundation

struct Constants {
    
    static let APIkey = "d63c59d15fdc060e1c41947aa0dfc6b0"
    static let baseURL = "https://api.themoviedb.org"
    static let idKeywordBasedOnWebcomicOrWebtoon = "288474"
    static let idKeywordInterKoreanRelations = "267761"
    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
    
}

struct IdTv {
    
    let idTv1 = "96160"
    let idTv2 = "68814"
    let idTv3 = "94796"
    let idTv4 = "87553"
    let idTv5 = "129478"
    let idTv6 = "81821"
    let idTv7 = "81494"
    let idTv8 = "67391"
    let idTv9 = "92983"
}

let idTv: [IdTv] = [IdTv]()

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
        
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {

        guard let url = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=\(Constants.APIkey)&language=ko-KR&page=1") else {return}
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
    
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/discover/tv?api_key=\(Constants.APIkey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_keywords=288474&with_watch_monetization_types=flatrate") else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
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
        
        
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/3/search/tv?api_key=\(Constants.APIkey)&query=\(query)") else {
            return
        }

        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
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
        
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void)  {
            

            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                    completion(.success(results.items[0]))

                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }

            }
            task.resume()
        }
    
    func getTvFromId(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/\(idTv.randomElement)?api_key=d63c59d15fdc060e1c41947aa0dfc6b0") else {return}
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
