import Foundation

enum FollowStatus {
    case NotFollowing, FreeFollow, PremiumFollow
}

class Friend {
    var name: String?
    var followStatus: FollowStatus

    init() {
        followStatus = FollowStatus.NotFollowing
    }

    convenience init(name: String?) {
        self.init()
        self.name = name
    }
}
