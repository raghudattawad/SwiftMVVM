//
//  MoviesClient.swift
//  MVVMDemo
//
//  Created by Raghavendra Dattawad on 8/10/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {

    func fetchMovies(completion:@escaping (_ movies:[NSDictionary]) -> ()){
    
/// fetch the data ///

        let URLString = "http://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: URLString)
        let request = URLRequest(url: url!)
        
        
        
//        let URLString = "http://itunes.apple.com/us/rss/topmovies/limit=25/json"
//        let url = URL(string: URLString)
//        let request = URLRequest(url: url!)
        
         let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
           
            if error != nil{
                
                
                print(error! ?? "")
            }
            
            if let usableData = data {
                do {
                    
                    var json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)  as! NSDictionary
                  if let movies =  json.value(forKeyPath:"feed.entry") as? [NSDictionary]{
                        completion(movies)
                    return
                    
                        
                    }
                    
              
                } catch {
                    print("JSON Processing Failed")
                }
            }
            
    
        })
        task.resume()
    }

}
        





