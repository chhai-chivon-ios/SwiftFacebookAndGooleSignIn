//
//  ViewController.swift
//  FacebookGoogleSignIn
//
//  Created by Tola Pheng on 1/18/17.
//  Copyright © 2017 Tola Pheng. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController , GIDSignInUIDelegate, GIDSignInDelegate, FBSDKLoginButtonDelegate{
  

    @IBOutlet weak var btnFacebookLogin: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Google
        var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print("Error \(error)")
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        //let signInButton = GIDSignInButton()
        //signInButton.center = view.center
        
        //view.addSubview(signInButton)
        
        // End Google
        
//        let login = FBSDKLoginButton()
//        login.delegate = self
//        login.center = self.view.center
//        login.readPermissions = ["public_profile"]
//        self.view.addSubview(login)
        
        btnFacebookLogin.readPermissions = ["email","public_profile"]
        btnFacebookLogin.delegate = self
        
        
    }

    
    // Google
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("error  \(error)")
        }
        
        print(user.profile.imageURL(withDimension: 200))
        print(user.profile.email)
        print(user.userID)
        print(user.profile.name)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GoogleProfileViewController") as! GoogleProfile
        viewController.user = user
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    // Facebook
    
    /**
     Sent to the delegate when the button was used to login.
     - Parameter loginButton: the sender
     - Parameter result: The results of the login
     - Parameter error: The error (if any) from the login
     */
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        displayProfile()
        
    }
 
    
    
    /**
     Sent to the delegate when the button was used to logout.
     - Parameter loginButton: The button that was clicked.
     */
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
    func displayProfile(){
        print("display profile")
    
        let parameters = ["fields" : "email, name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start { (connection, result, error) in
            debugPrint(result ?? "")
    //a
//                var resultDic = NSDictionary()
//                resultDic = result as! NSDictionary
//    
//                debugPrint(resultDic.object(forKey: "email")!)
//
//                let data =  resultDic.object(forKey: "picture") as! NSDictionary
//    
//                let picture = data.object(forKey: "data") as! NSDictionary
//                let url = picture.object(forKey: "url")!
//                debugPrint(url)
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "FacebookProfile") as! FacebookProfile
            viewController.result = result as! NSDictionary?
            self.present(viewController, animated: true, completion: nil)
            
                
    
        }
            
            
    }
    
    // End Facebook



}

