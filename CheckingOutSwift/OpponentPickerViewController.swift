import Foundation
import UIKit

class OpponentPickerViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var pickingLabel: UILabel!
    @IBOutlet weak var opponentImageView: UIImageView!
    @IBOutlet weak var opponentNameLabel: UILabel!
    @IBOutlet weak var opponentMottoLabel: UILabel!

    private var pickingLabelDotsCount : NSInteger = 2
    private var maxPickingLabelDotsCount : NSInteger = 7
    private var pickingLabelTimer : NSTimer?
    private var opponentTimer : NSTimer?
    private var continueButtonTimer : NSTimer?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool)  {
        super.viewWillAppear(animated)
        setupContinueButton()
        setupPickingLabel()
        setupOpponent()
    }

    override func viewWillDisappear(animated: Bool)  {
        super.viewWillDisappear(animated)
        pickingLabelTimer?.invalidate()
        opponentTimer?.invalidate()
        continueButtonTimer?.invalidate()
    }

    private func setupContinueButton() {
        continueButton.setTitle("Continue", forState: UIControlState.Normal)
        continueButtonTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("updateContinueButton"), userInfo: nil, repeats: false)
    }

    func updateContinueButton() {
        continueButton.hidden = false
        pickingLabelTimer?.invalidate()
        opponentTimer?.invalidate()
        continueButtonTimer?.invalidate()
    }

    private func setupPickingLabel() {
        updatePickingLabel()
        pickingLabelTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("updatePickingLabel"), userInfo: nil, repeats: true)
    }

    func updatePickingLabel() {
        var text = "Picking Your Opponent"
        var dots = ""
        for var i = 0; i < pickingLabelDotsCount; ++i {
            dots += "."
        }
        text += dots
        pickingLabel.text = text
        ++pickingLabelDotsCount
        if pickingLabelDotsCount > maxPickingLabelDotsCount {
            pickingLabelDotsCount = 2
        }
    }

    private func setupOpponent() {
        updateOpponent()
        opponentTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateOpponent"), userInfo: nil, repeats: true)
    }

    func updateOpponent() {
        var randomFriend = Friend.random()
        opponentImageView.image = randomFriend.image
        opponentNameLabel.text = randomFriend.name
        opponentMottoLabel.text =  randomFriend.motto
    }

    @IBAction func didTapContinueButton(sender: AnyObject) {
        self.performSegueWithIdentifier("pushQuestionFromOpponent", sender: nil)
    }
}
