//
//  MusicPlayerVC.swift
//  MusicPlayer
//
//  Created by Aditya on 03/02/25.
//

import UIKit
import AVFoundation

class MusicPlayerVC: UIViewController ,AVAudioPlayerDelegate {

    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var MusicNameLbl: UILabel!
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var musicProgressSlider: UISlider!
    @IBOutlet weak var backwardBtn: UIButton!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var LoopBtn: UIButton!
    @IBOutlet weak var musicCountdownLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    var audioPlayer: AVAudioPlayer?
        var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAudioPlayer()
        audioPlayer?.play()
        startTimer()
        playPauseBtn.isSelected = true
    }
    func setupAudioPlayer() {
            guard let path = Bundle.main.path(forResource: "raag-pilu", ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.delegate = self
                
                musicProgressSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
                durationLbl.text = formatTime(audioPlayer?.duration ?? 0)
            } catch {
                print("Error loading audio file")
            }
        }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
        @IBAction func playPauseTapped(_ sender: UIButton) {
            sender.isSelected.toggle()
            if audioPlayer?.isPlaying == true {
                audioPlayer?.pause()
                timer?.invalidate()
            } else {
                audioPlayer?.play()
                startTimer()
            }
        }
        
        @IBAction func backwardTapped(_ sender: UIButton) {
            guard let player = audioPlayer else { return }
            player.currentTime = max(player.currentTime - 5, 0)
            updateUI()
        }
        
        @IBAction func forwardTapped(_ sender: UIButton) {
            guard let player = audioPlayer else { return }
            player.currentTime = min(player.currentTime + 5, player.duration)
            updateUI()
        }
        
        func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
           audioPlayer?.currentTime = TimeInterval(sender.value)
           updateUI()
       }
        @objc func updateUI() {
            guard let player = audioPlayer else { return }
            musicCountdownLbl.text = formatTime(player.currentTime)
            musicProgressSlider.value = Float(player.currentTime)
        }
        
        func formatTime(_ time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }

    @IBAction func likeBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    

}
