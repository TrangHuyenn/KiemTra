//
//  ViewController.swift
//  DenGiaoThong
//
//  Created by Trang Huyền on 6/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var light1: UIImageView!
    @IBOutlet weak var light3: UIImageView!
    @IBOutlet weak var light2: UIImageView!
    var timer_light : Timer!
    var numRed: Int = 0
    var numGreen: Int = 0
    var numYellow: Int = 0
    var time : Int = 0
    var numberSectionRed = 0
    var numberSectionGreen = 0
    var numberSectionYellow = 0


    
    override func viewDidLoad() {
        super.viewDidLoad()
        light1.layer.cornerRadius = light1.frame.width/2
        light2.layer.cornerRadius = light2.frame.width/2
        light3.layer.cornerRadius = light3.frame.width/2
        numberSectionRed = numRed
        numberSectionGreen = numGreen
        numberSectionYellow = numYellow
        
        timer_light = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(trafficLights), userInfo: nil, repeats: true)
    }
    
    @objc func trafficLights() {
        if time < numRed {
            light1.backgroundColor = UIColor.red
            light2.backgroundColor = UIColor.gray
            light3.backgroundColor = UIColor.gray

            if numberSectionRed > 0 {
                lbTime.text = stringTime(numberSectionRed)
                numberSectionRed -= 1
            }
            else {
                numberSectionRed = numRed
            }
        }
        
        else if time < numYellow + numRed {
            light1.backgroundColor = UIColor.gray
            light2.backgroundColor = UIColor.gray
            light3.backgroundColor = UIColor.yellow
            if numberSectionYellow > 0 {
                lbTime.text = stringTime(numberSectionYellow)
                numberSectionYellow -= 1
            }
            else {
                numberSectionYellow = numYellow
            }
        }
        else if time < numYellow + numRed + numGreen{
            light1.backgroundColor = UIColor.gray
            light2.backgroundColor = UIColor.green
            light3.backgroundColor = UIColor.gray
            if numberSectionGreen > 0 {
                lbTime.text = stringTime(numberSectionGreen)
                numberSectionGreen -= 1
            }
            else {
                numberSectionGreen = numGreen
            }
        }
        else {
            time = 0
        }
        time += 1
    }
    
    @IBAction func btnStop(_ sender: Any) {
        timer_light.invalidate()
    
    }
    
    func stringTime(_ x: Int) -> String {
        return "\(x < 10 ? "0\(x)" : "\(x)")"

    }
    @IBAction func btnSetting(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcSetting = storyboard.instantiateViewController(identifier: "settingScreen") as SettingViewController
        vcSetting.modalPresentationStyle = .fullScreen
        self.present(vcSetting, animated: true, completion: nil)
    }
    
}

