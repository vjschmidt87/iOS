//
//  PlayerController.swift
//  MusicPlayer
//
//  Created by retina on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class PlayerView: UIView {

    @IBOutlet var playerView: UIView!
    
    var music: AVAudioPlayer!
    
    var musics = ["Developers", "Rain-storm", "Aggressive-dogs-barking", "Traffic-noise-sound-effect", "Motorboat-sound"]
    var index = 0
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func playButton(_ sender: UIButton) {
        print("play")
        playMusic()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        print("pause")
        self.music.pause()
        self.statusLabel.text = "Paused"
    }
    
    @IBAction func Next(_ sender: UIButton) {
        randomize()
        getMusic()
        playMusic()
        //self.statusLabel.text = "Not supported yet"
    }
    
    override func awakeFromNib() {
        self.statusLabel.text = ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playerInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playerInit()
    }
    
    private func playerInit() {
        Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)
        addSubview(playerView)
        playerView.frame = self.bounds
        playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        getMusic()
    }
    
    private func randomize() {
        self.index = Int(arc4random_uniform(UInt32(musics.count)))
    }
    
    private func getMusic() {
        let url = Bundle.main.url(forResource: musics[self.index], withExtension: "mp3")!
        
        do {
            music = try AVAudioPlayer(contentsOf: url)
            
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    private func playMusic() {
        self.music.prepareToPlay()
        self.music.play()
        self.statusLabel.text = "Playing: " + self.musics[index]
    }

}
