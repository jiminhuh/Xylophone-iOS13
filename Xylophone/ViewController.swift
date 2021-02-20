//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    func playSound(key:String) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return print("No Sound") }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        let musicalKeyPressed =  sender.currentTitle!
        playSound(key: musicalKeyPressed)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
        }


    }
    
}
