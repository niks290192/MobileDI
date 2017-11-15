//
//  Song.swift
//  MobileDI
//
//  Created by NiKhil AroRa on 13/11/17.
//  Copyright © 2017 Nikhil Arora. All rights reserved.
//

import Foundation


struct Song {

	private var _artistUrl:String
	private var _artistId:String
	private var _artistName:String
	private var _artworkUrl100:String
	private var _collectionName:String
	private var _id:String
	private var _kind:String
	private var _name:String
	private var _releaseDate:String
	private var _url:String

	var artistUrl:String {
		return _artistUrl
	}

	var artistId:String {
		return _artistId
	}

	var artistName:String {
		return _artistName
	}

	var artworkUrl100:String {
		return _artworkUrl100
	}

	var collectionName:String {
		return _collectionName
	}

	var id:String {
		return _id
	}

	var kind:String {
		return _kind
	}

	var name:String {
		return _name
	}

	var releaseDate:String {
		return _releaseDate
	}

	var url: String {
		return _url
	}

	// MARK: Initializer for Song Video Object
	init(data: JSONDictionary) {
		//Artish Id
		if let artistId_ = data["artistId"] as? String {
			_artistId = artistId_
		} else { // in case we get nothing back from the JSON
			_artistId = ""
		}

		//ArtistURL
		if let artistUrl_ = data["artistUrl"] as? String {
			_artistUrl = artistUrl_
		} else { // in case we get nothing back from the JSON
			_artistUrl = ""
		}

		//Artist Name
		if let artistName_ = data["artistName"] as? String {
			_artistName = artistName_
		} else { // in case we get nothing back from the JSON
			_artistName = ""
		}

		//ArtworkURL
		if let artworkUrl100_ = data["artworkUrl100"] as? String {
			_artworkUrl100 = artworkUrl100_
		} else { // in case we get nothing back from the JSON
			_artworkUrl100 = ""
		}

		//Collection Name
		if let collectionName_ = data["collectionName"] as? String {
			_collectionName = collectionName_
		} else { // in case we get nothing back from the JSON
			_collectionName = ""
		}

		//Id
		if let id_ = data["id"] as? String {
			_id = id_
		} else { // in case we get nothing back from the JSON
			_id = ""
		}

		//Kind
		if let kind_ = data["kind"] as? String {
			_kind = kind_
		} else { // in case we get nothing back from the JSON
			_kind = ""
		}

		//Name
		if let name_ = data["name"] as? String {
			_name = name_
		} else { // in case we get nothing back from the JSON
			_name = ""
		}

		// Release Date
		if let releaseDate_ = data["releaseDate"] as? String {
			_releaseDate = releaseDate_
		} else { // in case we get nothing back from the JSON
			_releaseDate = ""
		}

		// URL
		if let url_ = data["url"] as? String {
			_url = url_
		} else { // in case we get nothing back from the JSON
			_url = ""
		}



	}
	
}
