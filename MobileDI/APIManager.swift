//
//  APIManager.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 14/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import Foundation

class APIManager {
	func loadData(urlString:String, completion:@escaping (_ result:[Song]) -> Void) {

		// turn URLSession caching off
		let config = URLSessionConfiguration.ephemeral
		let session = URLSession(configuration: config)

		let url = URL(string: urlString)!

		let task = session.dataTask(with: url) {(data, response, error) -> Void in
			if error != nil {
				print(error!.localizedDescription)
			} else { // JSON Serialization
				do {
					// .allowFragments - top level object is not an Array or Dictionary
					if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDictionary,
						let feed = json["feed"] as? JSONDictionary, let entries = feed["results"] as? JSONArray {

						// make a Song array
						var song = [Song]()
						// and iterate through the JSON to gather the song objects
						for (_,entry) in entries.enumerated() {
							let songs = Song.init(data: entry as! JSONDictionary)
							song.append(songs)
							print(songs.artistName)
						}
						// and send the song array back on the main queue
						DispatchQueue.global(qos: .background).async {
							DispatchQueue.main.async() {
								completion(song)
							}
						}
					}

					} catch {
						print("error in NSJSONSerialization")
					}
				}
			}
			task.resume()
		}
}
