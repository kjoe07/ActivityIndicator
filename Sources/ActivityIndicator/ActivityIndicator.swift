#if canImport(UIKit)
import UIKit
public extension UIViewController{
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     */
    func showActivityIndicator(color: UIColor) {
        let container: UIView = UIView()
        let loadingView: UIView = UIView()
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        container.tag = 100
        activityIndicator.tag = 101
        activityIndicator.color = color
        container.frame = self.view.frame
        container.center = self.view.center
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
       // #if os(iOS){
            switch traitCollection.userInterfaceStyle {
            case .dark:
                container.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
                loadingView.backgroundColor = UIColor(displayP3Red: 0.733, green: 0.733, blue: 0.733, alpha: 0.7)//UIColor(named: "loadingBackground")
            case .light:
                container.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)//UIColor(named: "containerWhite")
                loadingView.backgroundColor = UIColor(displayP3Red: 0.267, green: 0.267, blue: 0.267, alpha: 0.7)//UIColor(named: "loadingBackground")
            case .unspecified:
                print("unknow")

            @unknown default:
                print("well heat the heck is this")
        }
        let x =  UIScreen.main.bounds.midX
        let y = UIScreen.main.bounds.midY
        loadingView.center = CGPoint(x: x, y: y)//self.view.window?.center ?? self.view.center
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     */
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if let activity =   self.view.viewWithTag(101){
                (activity as? UIActivityIndicatorView)?.stopAnimating()
            }
            self.view.viewWithTag(100)?.removeFromSuperview()
        }
    }
}
#endif
