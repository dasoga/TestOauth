//
//  ViewController.swift
//  TestOauth
//
//  Created by Dante Solorio on 4/27/17.
//
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {
    
    
    var oauthswift: OAuth1Swift?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        oauthswift = OAuth1Swift(
            consumerKey:    "VTkUzSX4Yqzlzlu6MBLdcIJoP",
            consumerSecret: "1TdkkuboBIJjEOZsOk7NIiFlQbLtfAf1Lbvgqp27qLfGLXDACf",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        
        let handle = oauthswift?.authorize(
            withCallbackURL: URL(string: "TestOauth://testoauth/twitter")!,
            success: { credential, response, parameters in
                print(credential.oauthToken)
                print(credential.oauthTokenSecret)
                print(parameters["user_id"])
        },
            failure: { error in
                print(error.localizedDescription)
        }             
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

