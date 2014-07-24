import Foundation
import UIKit

class QuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool)  {
        super.viewWillAppear(animated)
        collectionView.backgroundColor = UIColor.clearColor()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 2
    }

    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        return 5
    }

    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        if indexPath.section == 0 {
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionCell", forIndexPath: indexPath) as UICollectionViewCell
            return cell
        }

        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnswerCell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }

    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        if indexPath.section == 1 {
            var nextQuestionVC = self.storyboard.instantiateViewControllerWithIdentifier("QuestionViewController") as QuestionViewController
            self.navigationController.pushViewController(nextQuestionVC, animated: true)
        }
    }

    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 60)
    }

}
