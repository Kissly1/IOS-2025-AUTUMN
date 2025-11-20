import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let manager = FavoriteItemsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
            tableView.backgroundColor = .black
            tableView.separatorStyle = .none
            tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        
      
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        
       
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        
       
        tableView.separatorStyle = .singleLine
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 //
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return manager.movies.count
        case 1: return manager.music.count
        case 2: return manager.books.count
        case 3: return manager.courses.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "🎬 Фильмы"
        case 1: return "🎵 Музыка"
        case 2: return "📚 Книги"
        case 3: return "🏫 Курсы"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        
        let item: FavoriteItem
        switch indexPath.section {
        case 0: item = manager.movies[indexPath.row]
        case 1: item = manager.music[indexPath.row]
        case 2: item = manager.books[indexPath.row]
        case 3: item = manager.courses[indexPath.row]
        default:
            fatalError("Unexpected section")
        }
        
        cell.configure(with: item)
        return cell
    }
    
    // MARK: - UITableViewDelegate (по желанию)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

