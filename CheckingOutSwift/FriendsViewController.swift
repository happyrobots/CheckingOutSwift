import Foundation
import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var items: [Friend] = [
        Friend(name: "Dogs"),
        Friend(name: "Cats"),
        Friend(),
        Friend(name: "Wolf"),
    ]

    var someString: String = ""

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(animated: Bool)  {
        super.viewWillAppear(animated)
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow(), animated: true)
    }

    func setupTableView() {
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsCell", forIndexPath: indexPath) as UITableViewCell
        let item = items[indexPath.row]
        cell.textLabel.text = item.name
        return cell
    }

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewControllerWithIdentifier("FriendsViewController") as FriendsViewController
        let item = items[indexPath.row]
        vc.title = item.name
        self.navigationController.pushViewController(vc, animated: true)
    }

}

