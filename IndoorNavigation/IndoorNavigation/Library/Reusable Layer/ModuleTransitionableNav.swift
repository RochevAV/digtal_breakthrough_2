import UIKit

protocol ModuleTransitionableNav: class {
    func pop(animated: Bool)
    func push(module: UIViewController, animated: Bool)
}

extension ModuleTransitionableNav where Self: UINavigationController {
    func pop(animated: Bool) {
        popViewController(animated: animated)
    }

    func push(module: UIViewController, animated: Bool) {
        pushViewController(module, animated: animated)
    }
}
