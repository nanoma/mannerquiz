//
//  Result2ViewController.swift
//  mannerquiz
//
//  Created by 花田奈々 on 2016/02/18.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class Result2ViewController: UIViewController {
    
    
    var correctAnswer: Int = 0
    @IBOutlet var resultLabel2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
           resultLabel2.text = "\(correctAnswer)"
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
