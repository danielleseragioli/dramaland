
import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        let secondVC = UINavigationController(rootViewController: UpcomingViewController())
        let thirdVC = UINavigationController(rootViewController: SearchViewController())
        let fourthVC = UINavigationController(rootViewController: DownloadsViewController())
        
        
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        secondVC.tabBarItem.image = UIImage(systemName: "play.circle")
        thirdVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        fourthVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        firstVC.title = "Home"
        secondVC.title = "Upcoming"
        thirdVC.title = "Search"
        fourthVC.title = "Downloads"
        
        tabBar.tintColor = .systemPink
        
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
        
    }


}

