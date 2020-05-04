//
//  ResultsViewController.swift
//  Randomati2
//
//  Created by SNQMACPRO on 13.04.2020.
//  Copyright © 2020 SNQMACPRO. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resultsLabel.numberOfLines = 4
         resultsLabel.text! += "\(allreadyUsed)"
     }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
