//
//  ResponsesTableViewController.swift
//  MyAPIDesign
//
//  Created by Jeff Norton on 7/14/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class ResponsesTableViewController: UITableViewController {
    
    // MARK: - Stored Properites
    
    var surveys: [Survey] = []
    
    // MARK: - General

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)

        SurveyController.getSurveys { (surveys) in
            
            self.surveys = surveys
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return surveys.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("responseCell", forIndexPath: indexPath)

        let survey = surveys[indexPath.row]
        
        cell.textLabel?.text = survey.response
        cell.detailTextLabel?.text = survey.name

        return cell
    }

}
