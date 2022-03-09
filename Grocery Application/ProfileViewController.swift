import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var cardDetails: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
        barAppearance.backgroundColor = .systemMint //Set navBar color to systemPink
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
       
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
           
        cardDetails.text = "Card Details \n Holder Name : \n Nishant Vaitage \n Card Number : \n XXXX-XXXX-XXXX-4419 \n Valid Upto : 04/25 \n CVV : 446"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
