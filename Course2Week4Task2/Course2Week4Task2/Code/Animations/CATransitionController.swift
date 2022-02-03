import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        let initialText = textLabel.text
        transitionForward()
        transitionBackward(initialText)
    }
    
    func transitionForward() {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = CATransitionType.moveIn
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        textLabel.layer.add(transition, forKey: "transitionForward")
        textLabel.textColor = UIColor.green
        textLabel.text = "Sliding!"
    }
    
    func transitionBackward(_ initialText: String?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) { [self] in
            let transition = CATransition()
            transition.duration = 1.0
            transition.type = CATransitionType.fade
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            textLabel.layer.add(transition, forKey: "transitionForward")
            textLabel.textColor = UIColor.orange
            textLabel.text = initialText
        }
    }
}
