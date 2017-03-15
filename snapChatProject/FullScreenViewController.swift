//
//  FullScreenViewController.swift
//  snapChatProject
//
//  Created by JC Dy on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var fullscreenSnap: UIImageView!
    var sentSnap: Snap?
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        if let snap = sentSnap {
            fullscreenSnap.image = snap.snapImage
            print(snap.snapImage)
            snap.seen = true
        }
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        fullscreenSnap.isUserInteractionEnabled = true
        fullscreenSnap.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        performSegue(withIdentifier: "fullscreenToFeed", sender: self)
        // Your action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
