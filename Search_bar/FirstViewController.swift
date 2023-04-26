//
//  FirstViewController.swift
//  Search_bar
//
//  Created by Mohan K on 28/11/22.
//

import UIKit

struct Group {
    let title: String
    let animals: [String]
    
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let animals: [String: [String]] = [
        "A": ["Ant Eater","Aligator"],
        "B": ["Bat", "Bear"],
        "C": ["Cat", "Camel"],
        "D": ["Deer", "Donkey", "Duck"],
        "E": ["Elephant", "Eagle"],
        "F": ["Frog", "Fox"],
        "G": ["Gorilla", "Giraffe", "Gila monster"],
        "H": ["Hippopotamus", "Hyena"],
        "I": ["Ibis", "Icefish"],
        "J": ["Jaguar", "Jelly fish", "Jackal"],
        "K": ["Kangaroo", "Kingfisher", "Kiwi"],
        "L": ["Lion", "Lepord", "Lobster"],
        "M": ["Mouse", "Monkey", "Macaw"],
        "N": ["Nutria", "Numbat"],
        "O": ["Octopus", "Owl", "Otter", "Ostrich"],
        "P": ["Penguin", "Parrot", "Peacock", "Pelican"],
        "Q": ["Quokka"],
        "R": ["Rat", "Rabbit", "Rockfish"],
        "S": ["Shark", "Sheep", "Seahorse", "Seal"],
        "T": ["Tiger", "Turtle", "Turkey"],
        "U": ["Uakaris", "Uinta", "Utah"],
        "V": ["Vampirebat", "Visayanpig", "Volcano rabbit"],
        "W": ["Walrus", "Wolf", "Worm", "Woombat"],
        "X": ["Xerus", "Xenoceratops"],
        "Y": ["Yak", "Yapok", "Yellow mongoose"],
        "Z": ["Zebra", "Zebra fish"]
    ]
    
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var models = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpData()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
        func setUpData() {
            for(key, value) in animals {
                models.append(Group(title: key, animals: value))
            }
            models = models.sorted(by: { $0.title < $1.title })
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0,
                                 y: view.safeAreaInsets.top,
                                 width: view.frame.size.width,
                                 height: view.frame.size.height-view.safeAreaInsets.top)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models[section].animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.section].animals[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "image2")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return models[section].title
    }
  
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Array(alphabet.uppercased()).compactMap({"\($0)" })
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let targetIndex = models.firstIndex(where: { $0.title == title }) else {
            return 0
        }
        return targetIndex
    }
}
