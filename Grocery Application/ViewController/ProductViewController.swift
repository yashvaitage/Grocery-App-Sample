import UIKit

class ProductViewController: UIViewController {
    
    
    var cartItem: String?
    var cartItemArray: [String] = []
    var image = UIImage()
    var productName = ""
    var descriptionProduct = ""
    var counta: Int?

    
    @IBOutlet weak var GroceryItemLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
        barAppearance.backgroundColor = .systemMint //Set navBar color to systemMint
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        productImage.image = image
        GroceryItemLabel.text = "You've Selected \(counta!) \(productName)"
        productDescriptionLabel.text = "\(descriptionProduct)"
        
        //self.tabBarController?.tabBar.isHidden = true // Hide Tab Bar
    }
    
    @IBAction func addToCartBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "cartItemSegue", sender: "\(productName)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "cartItemSegue") {
            
            let cartViewController = segue.destination  as! CartViewController
            cartViewController.productItemName = (sender as! String)
            cartViewController.hidesBottomBarWhenPushed = true
        }
    }
}
