import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizers()
    }
    
    
    private func addTapGestureRecognizers() {
        let tapForOrangeView = UITapGestureRecognizer(target: self, action: #selector(performChangeRadiusAnimation(sender:)))
        orangeView.addGestureRecognizer(tapForOrangeView)
        
        let tapForCyanView = UITapGestureRecognizer(target: self, action: #selector(performTransitionFadeAnimation(sender:)))
        cyanView.addGestureRecognizer(tapForCyanView)
        
        let tapForBlueView = UITapGestureRecognizer(target: self, action: #selector(performMoveAnimation(sender:)))
        tapForBlueView.addTarget(self, action: #selector(performRoatateAnimation(sender:)))
        blueView.addGestureRecognizer(tapForBlueView)
        
        let tapForGreenView = UITapGestureRecognizer(target: self, action: #selector(performMoveToCenterAnimation(sender:)))
        tapForGreenView.addTarget(self, action: #selector(performColorAnimation(sender:)))
        tapForGreenView.addTarget(self, action: #selector(performScaleAnimation(sender:)))
        greenView.addGestureRecognizer(tapForGreenView)
    }
    
    @objc private func performMoveToCenterAnimation(sender: UITapGestureRecognizer) {
        let value = view.center
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 1.0
        animation.fromValue = greenView.center
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.repeatCount = 2
        animation.autoreverses = true
        greenView.layer.add(animation, forKey: "moveToCenter")
    }
    
    @objc private func performColorAnimation(sender: UITapGestureRecognizer) {
        let finalColor = UIColor.magenta
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fromValue = greenView.backgroundColor
        animation.toValue = finalColor.cgColor
        animation.repeatCount = 2
        animation.autoreverses = true
        greenView.layer.add(animation, forKey: "color")
    }
    
    @objc private func performScaleAnimation(sender: UITapGestureRecognizer) {
        let scaleValue: CGFloat = 1.5
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.repeatCount = 2
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fromValue = 1
        animation.toValue = scaleValue
        animation.autoreverses = true
        greenView.layer.add(animation, forKey: "scale")
    }
    
    @objc private func performRoatateAnimation(sender: UITapGestureRecognizer) {
        let toRotate = 315 * .pi / 180.0
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fromValue = 0
        animation.toValue = CGFloat(toRotate)
        animation.repeatCount = 1
        blueView.layer.add(animation, forKey: "roatate")
        blueView.transform = blueView.transform.rotated(by: toRotate)
    }
    
    @objc private func performMoveAnimation(sender: UITapGestureRecognizer) {
        let finalePosition = cyanView.center.x
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.duration = 2.0
        animation.fromValue = blueView.center.x
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.toValue = finalePosition
        blueView.layer.add(animation, forKey: "moveX")
        blueView.center.x = finalePosition
    }
    
    @objc private func performTransitionFadeAnimation(sender: UITapGestureRecognizer) {
        let finalColor = UIColor.white
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fromValue = cyanView.backgroundColor
        animation.toValue = finalColor
        cyanView.layer.add(animation, forKey: "fade")
        cyanView.backgroundColor = finalColor
    }
    
    @objc private func performChangeRadiusAnimation(sender: UITapGestureRecognizer) {
        let finalRadius: CGFloat = 50
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = orangeView.layer.cornerRadius
        animation.toValue = finalRadius
        orangeView.layer.add(animation, forKey: "radius")
        orangeView.layer.cornerRadius = finalRadius
    }
}
