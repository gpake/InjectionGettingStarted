//
//  DetailViewController.swift
//  GettingStarted
//
//  Created by User on 04/05/2018.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @objc func injected() {
        configureView()
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description + "????"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        let observer = OtherObserver()
        // comment this line, Injection will work well
        // uncomment, `@objc func injected()` will not being called
        self.addObserver(observer, forKeyPath: "detailItem", options: .new, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

class OtherObserver: NSObject {
    
}
