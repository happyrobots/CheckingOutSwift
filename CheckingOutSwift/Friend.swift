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

    class func allComp() -> [Friend] {
        return [
            Friend(name: "Noob Trader", motto: "I know everything", image: nil),
            Friend(name: "Super Rich Trader", motto: "I have no money", image: nil),
            Friend(name: "Okay Trader", motto: "I'm okay", image: nil)
        ]
    }

    class func random() -> Friend {
        var list = allComp()
        var listCount = list.count
        var i = Int(rand()) % listCount
        return allComp()[i]
    }

}
