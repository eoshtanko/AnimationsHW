import UIKit

class UIKitDynamicController: UIViewController {

    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    
    var dynamicAnimator: UIDynamicAnimator!
    
    lazy var attachment: UIAttachmentBehavior =
    {
        let attachment = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorView.center)
        return attachment
    }()
    
    lazy var gravity: UIGravityBehavior =
    {
        let gravity = UIGravityBehavior(items: [animationView])
        return gravity
    }()
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        let touchPoint = recognizer.location(in: view)
        switch recognizer.state {
        case .began:
            dynamicAnimator = UIDynamicAnimator(referenceView: view)
            dynamicAnimator.addBehavior(attachment)
            dynamicAnimator.addBehavior(gravity)
        case .changed:
            let translation = recognizer.translation(in: view)
            guard let gestureView = recognizer.view else {
                return
            }
            gestureView.center = CGPoint(
                x: gestureView.center.x + translation.x,
                y: gestureView.center.y + translation.y
            )
            attachment.anchorPoint = touchPoint
            recognizer.setTranslation(.zero, in: view)
        default:
            ()
        }
    }
}
