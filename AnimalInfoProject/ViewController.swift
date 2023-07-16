//
//  ViewController.swift
//  AnimalInfoProject
//
//  Created by Seyma Catikkasli on 16.07.2023.
//

import UIKit
import AVFoundation
import AVKit


class ViewController: UIViewController {

    @IBOutlet weak var ostrich: AnimalView!
    @IBOutlet weak var zebra: AnimalView!
    @IBOutlet weak var lion: AnimalView!
    @IBOutlet weak var hippopotamus: AnimalView!
    @IBOutlet weak var gorilla: AnimalView!
    @IBOutlet weak var giraffe: AnimalView!
    @IBOutlet weak var elephant: AnimalView!
    @IBOutlet weak var cheetah: AnimalView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyViews()
    }
    private func setupMyViews() {
        
    
        cheetah.buttonTapped = {
            self.openVideo("cheetah")
        }
        elephant.buttonTapped = {
            self.openVideo("elephant")
        }
        giraffe.buttonTapped = {
            self.openVideo("giraffe")
        }
        hippopotamus.buttonTapped = {
            self.openVideo("hippopotamus")
        }
        lion.buttonTapped = {
            self.openVideo("lion")
        }
        zebra.buttonTapped = {
            self.openVideo("zebra")
        }
        ostrich.buttonTapped = {
            self.openVideo("ostrich")
        }
        gorilla.buttonTapped = {
            self.openVideo("gorilla")
        }
        
        cheetah.webUrl = "https://en.wikipedia.org/wiki/Cheetah"
        elephant.webUrl = "https://en.wikipedia.org/wiki/Elephant"
        giraffe.webUrl = "https://en.wikipedia.org/wiki/Giraffe"
        gorilla.webUrl = "https://en.wikipedia.org/wiki/Gorilla"
        hippopotamus.webUrl = "https://en.wikipedia.org/wiki/Hippopotamus"
        lion.webUrl = "https://en.wikipedia.org/wiki/Lion"
        zebra.webUrl = "https://en.wikipedia.org/wiki/Zebra"
        ostrich.webUrl = "https://en.wikipedia.org/wiki/Common_ostrich"
        
        cheetah.openWebAction = routeWebVC()
        elephant.openWebAction = routeWebVC()
        giraffe.openWebAction = routeWebVC()
        gorilla.openWebAction = routeWebVC()
        hippopotamus.openWebAction = routeWebVC()
        lion.openWebAction = routeWebVC()
        ostrich.openWebAction = routeWebVC()
        
        cheetah.layer.contents = UIImage(named:"cheetah.jpg")?.cgImage
        elephant.layer.contents = UIImage(named:"elephant.jpg")?.cgImage
        giraffe.layer.contents = UIImage(named:"giraffe.jpg")?.cgImage
        gorilla.layer.contents = UIImage(named:"gorilla.jpg")?.cgImage
        hippopotamus.layer.contents = UIImage(named:"hippopotamus.jpg")?.cgImage
        lion.layer.contents = UIImage(named:"lion.jpg")?.cgImage
        zebra.layer.contents = UIImage(named:"zebra.jpg")?.cgImage
        ostrich.layer.contents = UIImage(named:"ostrich.jpg")?.cgImage
        
      
       
    }
    
    
    func routeWebVC() -> (String) -> () {
        return {
            urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
    
    func openVideo(_ videoUrl: String) {
        guard let videoURL = Bundle.main.url(forResource: videoUrl, withExtension: "mp4", subdirectory: "Videos") else {
            return
        }
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
                
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    

}

