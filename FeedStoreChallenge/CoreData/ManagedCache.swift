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
	static func uniqueFeedCache(from context: NSManagedObjectContext) -> ManagedCache {
		return ManagedCache(context: context)
	}
}
