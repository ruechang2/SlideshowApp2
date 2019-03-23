import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    

        /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "スクリーンショット 2019-01-29 20.56.50",
            "スクリーンショット 2019-01-29 20.57.15",
            "スクリーンショット 2019-01-29 21.01.51",
          
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "スクリーンショット 2019-01-29 20.56.50")
        imageView.image = image
    }
    
    @IBAction func play1(_ sender: UIButton) {
    
    // タイマーを設定
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    
    }
    /// NSTimerによって、一定の間隔で呼び出される関数
  @objc  func updateTimer(_ timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("update")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
