//
//  QuizViewController.swift
//  mannerquiz
//
//  Created by 花田奈々 on 2016/02/17.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
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
        
        tmpArray.append(["お客様に上司を紹介するときの正しい言い方は？","私の上司、山田さんでございます。",
            "私の上司、山田部長でございます。", "私の上司、山田でございます。", 3])
        tmpArray.append(["敬語の使い方を誤っているのは？","打ち合わせ日程の件、承知いたしました。よろしくお願いいたします。",
            "打ち合わせ日程の件、了解いたしました。よろしくお願いいたします。","打ち合わせ日程の件、かしこまりました。よろしくお願いいたします。",2])
        tmpArray.append(["電話がかかってきましたが、相手が名乗りませんでした。どうやって聞き出すのが正しい？","失礼ですが、お名前を教えていただいてもよろしいでしょうか？","恐縮ですが、お名前頂戴してもよろしいでしょうか？","恐縮ですが、お名前をうかがってもよろしいでしょうか？",3])
        tmpArray.append(["お取引先から電話がかかってきました。お取引先の方はあなたの上司に用事があったようですが、あいにく外出中です。何と答える？","ただいま山田は外出中です。いかがいたしますか？","ただいま山田は外出中です。戻り次第、折り返しさせていただきます。","ただいま山田は外出中です。電話があったことを伝えておきます。",1])
        tmpArray.append(["ビジネスメールの書き出しで、1番始めに来るのは？","名前（◯◯様）","会社名（◯◯会社）","部署名（◯◯部）",2])
        
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
    
    @IBAction func choiceAnswer(sender: UIButton){
        if quizArray[0][4] as! Int == sender.tag {
            
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //問題が解き終わったら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult(){
        performSegueWithIdentifier("toResultView", sender: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView"){
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
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
