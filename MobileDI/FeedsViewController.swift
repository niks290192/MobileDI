 //
//  FeedsViewController.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 13/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import UIKit
import SDWebImage
import EZLoadingActivity


private let reuseIdentifier = "Cell"

class FeedsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	var songs = [Song]()
	@IBOutlet weak var feedsCollectinView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

		

		//Call API
		if AppHelper.checkForInternetConnection() {
			EZLoadingActivity.show("Loading...", disableUI: true)
			let API = APIManager()
			API.loadData(urlString: iTunesURL,completion:didLoadData)
		} else {

		}

    }

	@IBAction func unwindToHome(segue: UIStoryboardSegue) {
	}

	func didLoadData(result:[Song]){
		print("\(songs.count)")
		songs = result
		EZLoadingActivity.hide(true, animated: true)
		feedsCollectinView.reloadData()
	}


	@IBAction func logoutBtn(_ sender: UIButton) {
		AppHelper.removeFromUserDefault(value: "LoggedIn")
		self.dismiss(animated: false, completion: nil)
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier :"ViewController") as! ViewController
		self.present(viewController, animated: true)
	}



	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return songs.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedsCollectionViewCell
		cell.songName.text! = songs[indexPath.row].name
		cell.artistName.text! = songs[indexPath.row].artistName
		cell.ArtWork.sd_setImage(with: URL(string: "\(songs[indexPath.row].artworkUrl100)"), completed: nil)
		return cell
	}
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showSongDetail" {
			if let indexPaths = feedsCollectinView?.indexPathsForSelectedItems {
				let destinationController = segue.destination as! FeedDetaislViewController
				destinationController.song = songs[indexPaths[0].row]
				feedsCollectinView?.deselectItem(at: indexPaths[0], animated: false)
			}
		}
    }


}
