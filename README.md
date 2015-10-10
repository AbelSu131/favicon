# favicon
Swift - 异步加载各网站的favicon图标，并在单元格中显示
。重点是单元格中图片的异步加载，以及didSet的用法

```
import UIKit
 
  class FaviconTableViewCell: UITableViewCell {
     
    //此操作队列运行下载的完成处理器
    // var operationQueue:NSOperationQueue?
     
    //此单元格显示的URL
    var url:NSURL? {
        //当URL发生变化
        didSet {
            //显示此文本
            self.textLabel?.text = self.url?.host
             
            //创建请求
            let request = NSURLRequest(URL: self.url!)
            let session = NSURLSession.sharedSession()
             
            let dataTask = session.dataTaskWithRequest(request,
                completionHandler: {(data, response, error) -> Void in
                    //将获取到的数据转化成图像
                    let image = UIImage(data: data!)
                    //对UI的更新必须在主队列上完成
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        () -> Void in
                        //将已加载的图像赋予图像视图
                        self.imageView?.image = image
                        //图像视图可能已经因为新图像而改变了尺寸
                        //所以需要重新调整单元格的布局
                        self.setNeedsLayout()
                    })
 
            }) as NSURLSessionTask
             
            //使用resume方法启动任务
            dataTask.resume()
        }
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 }
 
```
运行结果：

![image](https://github.com/AbelSu131/favicon/blob/master/NSOperationfavicon.png)
