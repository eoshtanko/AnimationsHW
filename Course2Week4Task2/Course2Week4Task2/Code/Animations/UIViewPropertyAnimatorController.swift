import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    
    private var animator: UIViewPropertyAnimator!
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        let params = UISpringTimingParameters(mass: 2.0, stiffness: 30.0, damping: 7.0, initialVelocity: .zero)
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1.0, timingParameters: params)
            animator.addAnimations {
                self.animationView.center.x += 300.0
                self.animationView.transform = self.animationView.transform.rotated(by: .pi)
                self.animationView.transform = self.animationView.transform.scaledBy(x: 1.5, y: 1.5)
            }
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: view).x / view.bounds.size.width
        case .ended:
            let xCoordAnimationView = animationView.layer.presentation()?.frame.midX
            if(xCoordAnimationView! >= view.center.x) {
                animator.startAnimation()
            } else {
                animator.isReversed = true
                animator.startAnimation()
            }
        default:
            ()
        }
    }
}

