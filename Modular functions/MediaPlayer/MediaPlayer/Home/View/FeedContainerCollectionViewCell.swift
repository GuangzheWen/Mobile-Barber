import UIKit

// home page container collection view cell

class FeedContainerCollectionViewCell: UICollectionViewCell {

    // reuse identifier of cell
    static let reuseIdentifierString = "FeedContainerCollectionViewCell"

    private(set) var viewController: UIViewController?

    public func config(with viewController: UIViewController) {
        self.viewController?.view.removeFromSuperview()
        self.viewController = viewController

        if let view = self.viewController?.view {
            self.contentView.addSubview(view)
            view.snp.makeConstraints { make in
                make.edges.equalTo(0)
            }
        }
    }
    
}
