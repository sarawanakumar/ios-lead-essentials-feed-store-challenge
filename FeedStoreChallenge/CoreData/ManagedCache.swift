//
//  ManagedCache+CoreDataClass.swift
//  FeedStoreChallenge
//
//  Created by Saravanakumar S on 20/06/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManagedCache)
final class ManagedCache: NSManagedObject {
	@NSManaged public var timestamp: Date
	@NSManaged public var feed: NSOrderedSet
}

extension ManagedCache {
	static func uniqueFeedCache(from context: NSManagedObjectContext) throws -> ManagedCache {
		try fetch(context: context).map(context.delete)
		return ManagedCache(context: context)
	}

	static func fetch(context: NSManagedObjectContext) throws -> ManagedCache? {
		let request = NSFetchRequest<ManagedCache>(entityName: ManagedCache.entity().name!)
		return try context.fetch(request).first
	}

	var localFeed: [LocalFeedImage] {
		feed.compactMap { ($0 as? ManagedFeedImage)?.local }
	}
}
