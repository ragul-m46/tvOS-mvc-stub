//
//  CoffeeDetailViewController.swift
//  CoffeeApp
//
//  Created by Mac-OBS-18 on 17/01/23.
//

import UIKit
import AVKit

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playVideoButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    var coffeeName = String()
    var coffeeDescription = String()
    var coffeeImage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideoButton.layer.cornerRadius = 45
        backButton.layer.cornerRadius = 45
        titleLabel.text = coffeeName
        descriptionLabel.text = coffeeDescription
        coffeeImageView.loadImage(urlString: coffeeImage)
    }
    
    // MARK: - Button Actions
    
    @IBAction func playVideoAction(_ sender: Any) {
        let videoURL = URL(string: "https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
