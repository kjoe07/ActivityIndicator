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
        let x = view.bounds.midX
        let y = view.bounds.midY
        loadingView.center = CGPoint(x: x, y: y)//self.view.window?.center ?? self.view.center
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 40),
            activityIndicator.widthAnchor.constraint(equalToConstant: 40),
            loadingView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 80),
            loadingView.widthAnchor.constraint(equalToConstant: 80),
            loadingView.topAnchor.constraint(equalTo: container.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 80),
            container.heightAnchor.constraint(equalToConstant: 80)
        ])
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
