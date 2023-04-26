//
//  ViewController.swift
//  Search_bar
//
//  Created by Mohan K on 28/11/22.
//

import UIKit

class ViewController: UIViewController {
   
    let data = [
    "Air",
    "Bumble",
    "Camera",
    "Donauts",
    "Element",
    "Fox",
    "Grammar",
    "Hang on",
    "Idol",
    "Jack Sparrow",
    "Kindlee",
    "Lollipop",
    "Mint",
    "Nike",
    "Opera",
    "Paperboat",
    "Quora",
    "Rapido",
    "Sync",
    "Tik",
    "Uranium",
    "Verizon",
    "Wipro",
    "Xolo",
    "Yolo",
    "Zine"
    ]
    
    var filteredData: [String]!
    
    @IBOutlet weak var Searchbar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        filteredData = data
        
        tableview.delegate = self
        tableview.dataSource =  self
        
       Searchbar.delegate = self
    }
}

    extension ViewController:  UITableViewDelegate, UITableViewDataSource
{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = filteredData[indexPath.row]
            return cell
        }
        
    }
        extension ViewController: UISearchBarDelegate {
            func searchBar(_ Searchbar: UISearchBar, textDidChange searchText: String) {
                
                filteredData = []
                
                if searchText == ""
                {
                    filteredData = data
                }
                for word in data
                {
                    
                    if word.uppercased().contains(searchText.uppercased())
                    {
                        filteredData.append(word)
                    }
                }
                self.tableview.reloadData()
            }
        }
    


