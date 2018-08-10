//
//  TasksViewModel.swift
//  MVVMDemo
//
//  Created by Raghavendra Dattawad on 8/10/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit

class TaskViewModel:NSObject {

   @IBOutlet  var moviesClient:MoviesClient!
    var movies:[NSDictionary]?
    func fetchMovies(completion:@escaping () -> ()){
        
        moviesClient.fetchMovies{ movies in
            
            self.movies  = movies
    
            completion()
            
        }
    }
    
    /// two methods  /////
    
    func numberofModelInSection(section:Int) -> Int{
        return movies?.count ?? 0
    }
   
    
    func titleForIndexpath(indexpath:NSIndexPath) -> String {
        
        return movies?[indexpath.row].value(forKeyPath:"im:name.label" ?? "" ) as! String
    
        
    
    }
    
}
