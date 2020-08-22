import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerChoicePressed(_ sender: UIButton!) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
            if choice1.currentTitle == quizBrain.getAnswer() {
                choice1.backgroundColor = UIColor.green
            }
            else if choice2.currentTitle == quizBrain.getAnswer() {
                choice2.backgroundColor = UIColor.green
            }
            else{
                choice3.backgroundColor = UIColor.green
            }
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        let choices : [String] = quizBrain.getChoices()
        choice1.setTitle(choices[0], for: [])
        choice2.setTitle(choices[1], for: [])
        choice3.setTitle(choices[2], for: [])
        scoreLabel.text = "Score: " + String(quizBrain.getScore())
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }

}
