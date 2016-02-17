//
//  ResultViewController.swift
//  mannerquiz
//
//  Created by 花田奈々 on 2016/02/17.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var haikeiImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultLabel.text = "\(correctAnswer)"
        
        
        if correctAnswer == 9{
            haikeiImageView.image = UIImage(named: "")
        } else if correctAnswer >= 6{
            haikeiImageView.image = UIImage(named: "")
        } else if correctAnswer > 3 {
            haikeiImageView.image = UIImage(named: "")
        } else {
            haikeiImageView.image = UIImage(named: "")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
