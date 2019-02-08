//
//  LogsVCTableViewController.swift
//  GoParkingPlease
//
//  Created by Ammar AlTahhan on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import SAPFiori

struct Log {
    var building: String
    var duration: String
    var time: String
}

class LogsVC: UITableViewController {
    
    var logs: [Log] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FUITimelineCell.self, forCellReuseIdentifier: FUITimelineCell.reuseIdentifier)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundBase)
        tableView.separatorStyle = .none
        
        logs = [
            Log(building: "You parked at: Building 19", duration: "4h 13m", time: "8:03 AM"),
            Log(building: "You parked at: Building 20", duration: "1h 2m", time: "11:12 AM"),
            Log(building: "You parked at: Building 19", duration: "0h 49m", time: "2:00 PM"),
            Log(building: "You parked at: Discovery Square", duration: "5h 1m", time: "6:12 PM")
        ]
    }
    
    // Table delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timelineCell = tableView.dequeueReusableCell(withIdentifier: FUITimelineCell.reuseIdentifier, for: indexPath) as! FUITimelineCell
        let log = logs[indexPath.row]
        timelineCell.timelineWidth = CGFloat(95.0)
        timelineCell.headlineText = log.building
        timelineCell.subheadlineText = log.duration
        timelineCell.nodeImage = FUITimelineNode.open
        timelineCell.eventText =  log.time
        timelineCell.statusImage = UIImage() // TODO: Replace with your image
        
        return timelineCell
    }
}
