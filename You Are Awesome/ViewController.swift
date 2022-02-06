//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Qingwan(Cecelia) Cheng on 1/22/22. blah
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfSounds = 6
    let totalNumberOfImages = 9
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    func playSound(name: String)
    {
        if let sound = NSDataAsset(name: name){
            do {
               try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 Error: \(error.localizedDescription) Counld not initialize AVAudioPlayer object.")
            }
        } else {
            print("😡 Counld not read data from file sound0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous? That's You!",
                        "You've Got The Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds)
        print("*** The new sound number is \(soundNumber)")
        playSound(name: "sound\(soundNumber)")
        
        
//        messageLabel.text = messages[messageNumber]
//        messageNumber += 1
//        if messageNumber == messages.count {
//            messageNumber = 0
//        }
        
        // let imageName = "image" + String(imageNumber)
//        let imageName = "image\(imageNumber)"
//        imageView.image = UIImage(named: imageName)
//        imageNumber = imageNumber + 1
//        if imageNumber == 10 {
//            imageNumber = 0
//        }
        
//        let awesomeMessage = "You Are Awesome!"
//        let greatMessage = "You Are Great!"
//        let bombMessage = "You Are Da Bomb!"
//
//        if messageLabel.text == awesomeMessage {
//            messageLabel.text = greatMessage
//            imageView.image = UIImage(named: "image1")
//        } else if messageLabel.text == greatMessage{
//            messageLabel.text = bombMessage
//            imageView.image = UIImage(named: "image2")
//        } else {
//            messageLabel.text = awesomeMessage
//            imageView.image = UIImage(named: "image0")
//        }
    
    }
}
