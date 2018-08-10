//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Raghavendra Dattawad on 8/9/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
  @IBOutlet        var viewModel:TaskViewModel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchMovies {
          
           DispatchQueue.main.async {
        
            self.tableView.reloadData()
        
            
            }
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberofModelInSection(section: 10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    
        configureCell(cell: cell, forIndexPath: indexPath as NSIndexPath )
        
        return cell
        
    }
    func configureCell(cell:UITableViewCell, forIndexPath:NSIndexPath){
        
        
        cell.textLabel?.text = viewModel.titleForIndexpath(indexpath: forIndexPath)
        
    }
    
    
    
}

