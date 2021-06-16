//
//  SettingViewController.swift
//  DenGiaoThong
//
//  Created by Trang Huyền on 6/16/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var txtYellow: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtRed: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        txtRed.keyboardType = .numberPad
        txtGreen.keyboardType = .numberPad
        txtYellow.keyboardType = .numberPad
        
    }
    
    @IBAction func btnOK(_ sender: Any) {
        
        guard let numRedLight = txtRed.text, let numGreenLight = txtGreen.text,let numYellowLight = txtYellow.text else { return  }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcHome = storyboard.instantiateViewController(identifier: "Home") as ViewController
        vcHome.modalPresentationStyle = .fullScreen
        
        vcHome.numRed = Int(numRedLight) ?? 2
        vcHome.numGreen = Int(numGreenLight) ?? 2
        vcHome.numYellow = Int(numYellowLight) ?? 2
        
        
        self.present(vcHome, animated: true, completion: nil)

    }
    
   
}
