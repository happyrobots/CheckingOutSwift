import Foundation

enum FollowStatus {
    case NotFollowing, FreeFollow, PremiumFollow
}

class Friend {
    var name: String?
    var motto: String?
    var image: UIImage?
    var followStatus: FollowStatus

    init() {
        followStatus = FollowStatus.NotFollowing
    }

    convenience init(name: String?) {
        self.init()
        self.name = name
    }

    convenience init(name: String?, motto: String?, image: UIImage?) {
        self.init(name: name)
        self.motto = motto
        self.image = image
    }
}

class RandomCompFriendPicker {
    var friends = [
        Friend(name: "Noob Trader", motto: "I know everything", image: UIImage(named: "trader-noob")),
        Friend(name: "Super Rich Trader", motto: "I have no money", image: UIImage(named: "trader-expert")),
        Friend(name: "Okay Trader", motto: "I'm okay", image: UIImage(named: "trader-okay"))
    ]

    func pick() -> Friend {
        var listCount = friends.count
        var i = Int(arc4random() % UInt32(listCount))
        return friends[i]
    }
}
