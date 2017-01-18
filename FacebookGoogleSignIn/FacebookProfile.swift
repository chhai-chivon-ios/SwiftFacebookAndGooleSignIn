//
//  FacebookProfile.swift
//  FacebookGoogleSignIn
//
//  Created by Tola Pheng on 1/18/17.
//  Copyright © 2017 Tola Pheng. All rights reserved.
//

import UIKit

class FacebookProfile: UIViewController {

    var result : NSDictionary?
    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if result != nil {
            
            
            let id = result?.object(forKey: "id") as! String
            let name = result?.object(forKey: "name") as! String
            let email = result?.object(forKey: "email") as! String
            let data =  result?.object(forKey: "picture") as! NSDictionary
            
            debugPrint(result?.object(forKey: "email")!)
            
            let picture = data.object(forKey: "data") as! NSDictionary
            let url = picture.object(forKey: "url") as! String
            debugPrint(url)
            
            userID.text = id
            userName.text = name
            userEmail.text = email
            userImage.kf.setImage(with: URL(string:url), placeholder: UIImage(named:"thumbs-up"))
            
        }
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
