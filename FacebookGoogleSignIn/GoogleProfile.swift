//
//  GoogleProfile.swift
//  FacebookGoogleSignIn
//
//  Created by Tola Pheng on 1/18/17.
//  Copyright © 2017 Tola Pheng. All rights reserved.
//

import UIKit
import GoogleSignIn
import Kingfisher

class GoogleProfile: UIViewController{

    var user : GIDGoogleUser?
    
    @IBOutlet weak var receiveingID: UILabel!
    @IBOutlet weak var receiveingName: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var userEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if user != nil {
            receiveingName.text = user?.profile.name
            receiveingID.text = user?.userID
            userEmail.text = user?.profile.email
            
            UserImage.kf.setImage(with: user?.profile.imageURL(withDimension: 200), placeholder: UIImage(named:"thumbs-up"))

        }
    }

    
    


}
