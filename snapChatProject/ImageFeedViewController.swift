//
//  ImageFeedViewController.swift
//  snapChatProject
//
//  Created by JC Dy on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    var snapToFullscreen: Snap?
    var fullscreenImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        feedTableView.reloadData()
        print(threads)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let feed = threadNames[section]
        return threads[feed]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedCell
        
        let feedName = threadNames[indexPath.section]
        let snapList = threads[feedName]!
        if indexPath.row < snapList.count {
            let snap: Snap = snapList[indexPath.row]
            
            let seconds = -snap.datePosted.timeIntervalSinceNow
            cell.timestamp.text = String(Int(round(seconds)) / 60) + " minutes ago"
            if snap.seen {
                cell.seenOrNotImage.image = #imageLiteral(resourceName: "read")
            } else {
                cell.seenOrNotImage.image = #imageLiteral(resourceName: "unread")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feedName = threadNames[indexPath.section]
        let snapList = threads[feedName]!
        if indexPath.row < snapList.count {
            let snap: Snap = snapList[indexPath.row]
            if !snap.seen {
                snapToFullscreen = snap
                fullscreenImage = snap.snapImage
                performSegue(withIdentifier: "feedToFullscreen", sender: self)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! FullScreenViewController
        dest.sentSnap = snapToFullscreen!
        dest.img = fullscreenImage
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
