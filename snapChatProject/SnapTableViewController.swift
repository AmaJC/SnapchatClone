//
//  SnapTableViewController.swift
//  snapChatProject
//
//  Created by JC Dy on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectedCategory: UILabel!
    
    @IBOutlet weak var snapButton: UIButton!
    
    var snapImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "snapCell") as! SnapCategoryCell
        cell.snapLabel.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory.text = threadNames[indexPath.row]
    }
    
    @IBAction func sendSnap(_ sender: UIButton) {
        if let feed = selectedCategory.text {
            if feed == "None" {
                failAlert()
                return
            }
            let snappy: Snap = Snap(name: "JC Dy", pic: snapImage!)
            addSnap(snap: snappy, threadName: feed)
        }
        successAlert()
    }
    
    func successAlert() {
        let alert = UIAlertController(title: "Oh Snap!", message: "Your snap was sent succesfully. Would you like to send another?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: {action in switch action.style{ default: self.navigationController?.popViewController(animated: true)}}))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {action in switch action.style{ default: self.navigationController?.popViewController(animated: true)}}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: "Oh Snap!", message: "You must choose a feed before sending a snap! Try again?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {action in switch action.style{ default: self.navigationController?.popViewController(animated: true)}}))
        self.present(alert, animated: true, completion: nil)
    }
    
//    func sendSnap() {
//        performSegue(withIdentifier: "backToImagePicker", sender: self)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
