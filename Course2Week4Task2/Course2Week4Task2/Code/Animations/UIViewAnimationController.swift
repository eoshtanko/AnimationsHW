import UIKit

class UIViewAnimationController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.animationView.center.x = self.view.frame.maxX - self.animationView.frame.width / 2
            self.animationView.transform = self.animationView.transform.rotated(by: .pi)
        })
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.view.transform = self.view.transform.rotated(by: .pi)
            self.flipButton.transform = self.flipButton.transform.rotated(by: .pi)
        })
    }
}
