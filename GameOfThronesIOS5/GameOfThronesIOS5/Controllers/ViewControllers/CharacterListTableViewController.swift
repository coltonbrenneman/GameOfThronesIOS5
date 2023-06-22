//
//  CharacterListTableViewController.swift
//  GameOfThronesIOS5
//
//  Created by Colton Brenneman on 6/22/23.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var topLevelDictionary: Character?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topLevelDictionary?.fullName.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)

        

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
} // End of class

