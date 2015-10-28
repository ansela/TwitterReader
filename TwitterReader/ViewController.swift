//
//  ViewController.swift
//  TwitterReader
//
//  Created by Ashley Ansell on 10/21/15.
//  Copyright © 2015 Ashley Ansell. All rights reserved.
//

import UIKit
import STTwitter

class ViewController: UIViewController {

    @IBOutlet weak var textbox: UITextField!
    @IBAction func searchButtonClicked(sender: AnyObject) {
        if let username = textbox.text {
            getTwitterTimeline(username)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func getTwitterTimeline(usrname: String) {
        let twitter = STTwitterAPI.twitterAPIOSWithFirstAccount()
        
        twitter.verifyCredentialsWithUserSuccessBlock({ (username, userID) -> Void in
            print("Access granted for \(username)")
            twitter.getUserTimelineWithScreenName(usrname, count: 100, successBlock: { (tweets) -> Void in
                print("Got tweets for \(usrname)")
                }) { (error) -> Void in
                    print("Got error \(error)")
            }
            }) { (error) -> Void in
                print("Error!!!!! \(error.localizedDescription)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

