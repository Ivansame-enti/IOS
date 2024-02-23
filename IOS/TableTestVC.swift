//
//  TableTestVC.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 23/2/24.
//

import Foundation
import UIKit

class TableTestVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var numbersList: [Int] = []
    
    @IBOutlet weak var TextTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextTableView.dataSource = self
        TextTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCellID", for: indexPath) as? TextCell else {
            return UITableViewCell()
        }
        
        cell.textTitle.text = String(numbersList[indexPath.row])
        
        return cell
    }
    
    
    @IBAction func AddRowsBtPressed(_ sender: Any) {
        numbersList.append(numbersList.count+1)
        
        TextTableView.reloadData()
    }
}
