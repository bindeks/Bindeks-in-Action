
extension CALayer {
    class func bdkBackgroundGradient(startColor: UIColor, endColor: UIColor, start: CGPoint = CGPoint(x: 0, y: 1), end: CGPoint = CGPoint(x: 1, y: 0)) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors         = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint     = start
        gradient.endPoint       = end
        
        return gradient
    }
}
