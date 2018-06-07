//
//  BoardTableViewController.swift
//  Mons
//
//  Created by Jiyong Park on 29/05/2018.
//  Copyright © 2018 jungwon.sy. All rights reserved.
//

import UIKit

class BoardTableViewController: UITableViewController {
    var category = ""
    var categoryIndex = 0
    let boardArray = myDatas.boardArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete impleme	ntation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return boardArray[categoryIndex].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardContentCell", for: indexPath)
        cell.textLabel?.text = boardArray[categoryIndex][indexPath.row].content
        cell.detailTextLabel?.text = "작성자: " + boardArray[categoryIndex][indexPath.row].writer

        return cell
    }
}
