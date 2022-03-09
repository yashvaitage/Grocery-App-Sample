import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var songsList = [[String:Any]]()

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchTitleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        
        let songData1 = ["Name":"Get TogetherGet","Artist":"David Guetta","Image":UIImage(named: "Rectangle 690" ) ?? ""] as [String : Any]
        self.songsList.append(songData1)

        let songData2 = ["Name":"This Is What You","Artist":"Rihanna, Clvin","Image":UIImage(named: "Rectangle 691" ) ?? ""] as [String : Any]
        self.songsList.append(songData2)
        
        let songData3 = ["Name":"We Are The People","Artist":"Marttin Garrix, Bono","Image":UIImage(named: "Rectangle 691-1" ) ?? ""] as [String : Any]
        self.songsList.append(songData3)
        
        let songData4 = ["Name":"Intense","Artist":"Armin Van Buuren","Image":UIImage(named: "Rectangle 691-2" ) ?? ""] as [String : Any]
        self.songsList.append(songData4)
        
        let songData5 = ["Name":"Jackie Chan","Artist":"Dzeko,Preme, Post","Image":UIImage(named: "Rectangle 691-3" ) ?? ""] as [String : Any]
        self.songsList.append(songData5)

        print ("\(songsList)")
        
        let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
        barAppearance.backgroundColor = .systemMint //Set navBar color to systemPink
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        searchTitleLbl.text = "\tRecent Searches"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
         }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell
        if let dicData = self.songsList[indexPath.row] as? NSDictionary {
            cell?.lbl.text = dicData.value(forKey: "Name") as? String
            cell?.img.image = dicData.value(forKey: "Image")  as? UIImage
        }
        
        
        
        return cell!
    }

}
