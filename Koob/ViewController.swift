//
//  ViewController.swift
//  Koob
//
//  Created by Jatin patel on 10/31/15.
//  Copyright © 2015 Jatin patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var refreshControl: MJRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = MJRefreshControl()
        tableView.addSubview(refreshControl)
        refreshControl.setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = "Jatin"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
      
    }
}