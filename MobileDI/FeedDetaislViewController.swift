//
//  FeedDetaislViewController.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 14/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import UIKit
import SDWebImage

class FeedDetaislViewController: UIViewController {

	var song:Song!

	@IBOutlet weak var artWork: UIImageView! {
		didSet {
			artWork.sd_setImage(with: URL(string: "\(song.artworkUrl100)"), completed: nil)
		}
	}


	@IBOutlet weak var viewBtn: UIButton! {
		didSet {

		}
	}


	@IBOutlet weak var nameLabel: UILabel! {
		didSet {
			nameLabel.text! = song.name
		}
	}

	@IBOutlet weak var artistLabel: UILabel! {
		didSet{
			artistLabel.text! = song.artistName
		}
	}

	@IBOutlet weak var otherLabel: UILabel! {
		didSet{
			otherLabel.text! = song.collectionName
		}
	}
	
	@IBOutlet weak var moreBtn: UIButton! {
		didSet {
			moreBtn.setTitle("More By \(song.artistName)", for: UIControlState.normal)
		}
	}


	@IBAction func moreButton(_ sender: UIButton) {
		AppHelper.openURL(Url: song.artistUrl)
	}


	@IBAction func iTunes(_ sender: UIButton) {
		AppHelper.openURL(Url: song.url)
	}


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
