import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var isScrollingDown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y

        if yOffset > 36 && !isScrollingDown {
            isScrollingDown = true
            navigationItem.title = "Avatar"
            navigationController?.setNavigationBarHidden(false, animated: true)
                self.avatarLabel.alpha = 0
                self.avatarImageView.alpha = 0
        } else if yOffset <= 36 && isScrollingDown {
            isScrollingDown = false
            navigationItem.title = nil
            navigationController?.setNavigationBarHidden(true, animated: true)
                self.avatarLabel.alpha = 1
                self.avatarImageView.alpha = 1
        }
    }
}
