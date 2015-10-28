//
//  tweet.swift
//  
//
//  Created by Ashley Ansell on 10/21/15.
//
//

import Foundation

struct Tweet {
    let text: String
    
    static func parseTweets(json: AnyObject) -> [Tweet] {
        
        var tweets = [Tweet]()

        if let tweetArray = json as? [[String:AnyObject]] {
            for tweetInfo in tweetArray {
                if let tweetDictionary = tweetInfo as? [String: AnyObject] {
                    if let tweetText = tweetDictionary["text"] {
                        print(tweetText)
                        let tweet = Tweet(text: tweetText as! String)
                        tweets.append(tweet)
                    }
                }
            }
        }
        return tweets
    }
}
