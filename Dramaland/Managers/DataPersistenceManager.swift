
import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }

    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return} // reference to AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext

        let item = TitleItem(context: context) // store inside our database
        
        item.id = Int64(model.id)
        item.media_type = model.media_type
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.poster_path = model.poster_path
        item.overview = model.overview
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        item.release_date = model.release_date
        item.title = model.title
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
        
    }
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return} // reference to AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()
                
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>)-> Void) {
           
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
           let context = appDelegate.persistentContainer.viewContext
           context.delete(model)
           do {
               try context.save()
               completion(.success(()))
           } catch {
               completion(.failure(DatabasError.failedToDeleteData))
           }
           
       }
}
