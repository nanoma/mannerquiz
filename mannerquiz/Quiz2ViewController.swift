//
//  Quiz2ViewController.swift
//  mannerquiz
//
//  Created by 花田奈々 on 2016/02/18.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class Quiz2ViewController: UIViewController {
    
    //問題を格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var sentaku1: UIButton!
    @IBOutlet var sentaku2: UIButton!
    @IBOutlet var sentaku3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var tmpArray = [AnyObject]()
        
        //------クイズ内容-----------------//
        
        tmpArray.append(["友人の家に招かれました。家に上がるとき、上着はいつ脱ぐのが正しい？","玄関に入る前",
            "玄関に入ったとき", "部屋の中に入ってから", 1])
        tmpArray.append(["格式高いレストランに訪れました。食べ終わったスープのお皿をさげてほしいとき、スプーンはどこにおく？",
            "スープ皿の中に、スプーンを裏にして置いておく。","スープ皿の手前に、スプーンを裏にして置いておく。","スープ皿の奥に、スプーンを表にして置いておく。",3])
        tmpArray.append(["料亭でお客様が座る「上座」はどこ？","入り口から入ってすぐの席","入り口から一番遠い席","入り口から見て右側の席",2])
        tmpArray.append(["親しい友人から結婚式の招待状をもらった。正しい返信方法は？","葉書で出席を伝える。","親しい友人なので口頭で伝えるのみでよい。","電話で出席を伝える。",3])
        tmpArray.append(["神社にお参りにきました。正しい参拝順序は？","鈴を鳴らす→お賽銭を入れる→2礼2拍手1礼","2礼2拍手1礼→お賽銭を入れる→鈴を鳴らす","お賽銭を入れる→鈴を鳴らす→2礼2拍手1礼",3])
        
        //------クイズ内容-----------------//
        
        //問題をシャッフルしてquizArrayに格納
        
        while (tmpArray.count > 0){
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()

    }
    
    
    func choiceQuiz(){
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンに選択肢のテキストをセット
        sentaku1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        sentaku2.setTitle(quizArray[0][2] as? String , forState: .Normal)
        sentaku3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer2(sender: UIButton){
        if quizArray[0][4] as! Int == sender.tag {
            //正解数が増えない！？
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //問題が解き終わったら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult2()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult2(){
        performSegueWithIdentifier("toResultView2", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView2"){
            
            let resultView2 = segue.destinationViewController as! Result2ViewController
            resultView2.correctAnswer = self.correctAnswer
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
