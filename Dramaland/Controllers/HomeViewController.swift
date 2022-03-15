
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum Sections: Int {
        case trendingTitles = 0
        case upcomingTitles = 1
        case popularTitles = 2
        case topRatedTitles = 3
    }
    
    
    let sectiontitles: [String] = ["Trending Dramas", "Upcoming", "Popular", "Top Rated"]
    
    
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        configureNavbar()
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
        
    
    
    // top configuration ----------------------------------------------------------------
    
    func configureNavbar(){
        
        // color
        navigationController?.navigationBar.tintColor = .systemPink

        // logo
        var image = UIImage(named: "dramalandLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        // left items
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
        
    }

    
    // table configuration ----------------------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectiontitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        switch indexPath.section{
            
        case Sections.trendingTitles.rawValue:
            
            let caseSectionTrending = APIcaller()
            caseSectionTrending.getMoviesFromIdThree{result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print (error.localizedDescription)
                }
                
            }
            
        case Sections.upcomingTitles.rawValue:
            
            let caseSectionUpcoming = APIcaller()
            caseSectionUpcoming.getMoviesFromIdTwo{result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print (error.localizedDescription)
                }
            }
            
        case Sections.popularTitles.rawValue:
            
            let caseSectionPopular = APIcaller()
            caseSectionPopular.getMoviesFromId {result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print (error.localizedDescription)
                }
            }
            
        case Sections.topRatedTitles.rawValue:
            
            let caseSectionTopRated = APIcaller()
            caseSectionTopRated.getTopRatedMovies {result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print (error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell

    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectiontitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
 

}
