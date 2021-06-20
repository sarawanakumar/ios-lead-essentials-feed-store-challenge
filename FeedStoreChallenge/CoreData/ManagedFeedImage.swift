//
//  ManagedFeedImage+CoreDataClass.swift
//  FeedStoreChallenge
//
//  Created by Saravanakumar S on 20/06/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedFeedImage)
final class ManagedFeedImage: NSManagedObject {
	@NSManaged public var id: UUID
	@NSManaged public var imageDescription: String?
	@NSManaged public var location: String?
	@NSManaged public var url: URL
	@NSManaged public var cache: ManagedCache
}

extension ManagedFeedImage {
	static func images(from local: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: local.map({ localFeedImage in
			let image = ManagedFeedImage(context: context)
			image.id = localFeedImage.id
			image.imageDescription = localFeedImage.description
			image.url = localFeedImage.url
			image.location = localFeedImage.location
			return image
		}))
	}
}
