import Foundation

class AnswerCell : UICollectionViewCell {
    private var originalBackgroundColor = UIColor.whiteColor()
    private var highlightedBackgroundColor = UIColor.greenColor()

    override func awakeFromNib() {
        super.awakeFromNib()
        originalBackgroundColor = self.backgroundColor;
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesBegan(touches, withEvent: event)
        UIView.animateWithDuration(0.1, animations: {
            self.backgroundColor = self.highlightedBackgroundColor
        })
    }

    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesCancelled(touches, withEvent: event)
        UIView.animateWithDuration(0.1, animations: {
            self.backgroundColor = self.originalBackgroundColor
        })
    }

    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesEnded(touches, withEvent: event)
        UIView.animateWithDuration(0.1, animations: {
            self.backgroundColor = self.originalBackgroundColor
        })
    }

    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesMoved(touches, withEvent: event)
    }
}