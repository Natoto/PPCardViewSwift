
### PPCardViewSwift

### 电影选项卡封面

![演示](http://7xicym.com1.z0.glb.clouddn.com/popaimg/IMG_6489.PNG)


```
import UIKit

class PPCardView: UIView {


    var contentView: UIView?{

        didSet{
            contentView?.contentMode = UIViewContentMode.scaleAspectFill;
            contentView?.transform = CGAffineTransform.identity;
            contentView?.removeFromSuperview()
            self.addSubview(contentView!)
            contentView?.frame = self.bounds
            contentView?.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            contentView?.center = self.center
            contentView?.layer.cornerRadius = 10;
            contentView?.layer.masksToBounds = true;
            print(self.contentView?.frame as Any)
        }
    };


    var bgImage:UIImage?{

        didSet{
            bgImageView?.image = bgImage;
        }
    };

    let bgImageView:UIImageView? = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage.init(named: "1")
        imageView.contentMode = UIViewContentMode.scaleAspectFill;

        let effect:UIBlurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        let effectview:UIVisualEffectView = UIVisualEffectView.init(effect: effect)
        effectview.frame = imageView.bounds;

        var arm1:UIViewAutoresizing! = [UIViewAutoresizing.flexibleWidth , UIViewAutoresizing.flexibleHeight]
        effectview.autoresizingMask = arm1

        imageView.addSubview(effectview)
        return imageView;
    }();


    override init(frame: CGRect) {

        super.init(frame: frame)
        self.addSubview(self.bgImageView!)
        self.bgImageView?.frame = self.bounds;

        let tap:UITapGestureRecognizer? = UITapGestureRecognizer.init(target: self, action:#selector(PPCardView.viewTap(ges:)))
        self.addGestureRecognizer(tap!)

    }



    func showInView(view:UIView!) -> () {

        self.removeFromSuperview();
        view.addSubview(self)
        self.center = view.center;

        self.contentView?.transform = CGAffineTransform.identity
        self.contentView?.removeFromSuperview();
        self.addSubview(self.contentView!)
        self.contentView?.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)

        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.contentView?.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        }){ (comp) in

            UIView.animate(withDuration: 0.1, animations: {

                self.contentView?.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
            })
        }


    }

    func hide() ->() {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.contentView?.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            self.contentView?.alpha = 0;
        }){ (comp) in
            self.contentView?.removeFromSuperview()
            self.contentView?.transform = CGAffineTransform.identity
            self.contentView?.alpha = 1;
//            let deadlineTime = DispatchTime.now() + .milliseconds(5)
//            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
//                self.removeFromSuperview()
//            }
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 0
            }){(com)in
                self.removeFromSuperview()
                self.alpha = 1
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func viewTap(ges:UITapGestureRecognizer) -> () {
        self.hide()
    }

}
```