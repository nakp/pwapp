// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APSMission.m instead.

#import "_APSMission.h"

@implementation APSMissionID
@end

@implementation _APSMission

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Mission" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Mission";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Mission" inManagedObjectContext:moc_];
}

- (APSMissionID*)objectID {
	return (APSMissionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"missionIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"missionID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic imageURL;

@dynamic locationLineOne;

@dynamic locationLineTwo;

@dynamic missionDescription;

@dynamic missionID;

- (int16_t)missionIDValue {
	NSNumber *result = [self missionID];
	return [result shortValue];
}

- (void)setMissionIDValue:(int16_t)value_ {
	[self setMissionID:@(value_)];
}

- (int16_t)primitiveMissionIDValue {
	NSNumber *result = [self primitiveMissionID];
	return [result shortValue];
}

- (void)setPrimitiveMissionIDValue:(int16_t)value_ {
	[self setPrimitiveMissionID:@(value_)];
}

@dynamic phone;

@dynamic timestamp;

@dynamic title;

@end

@implementation APSMissionAttributes 
+ (NSString *)date {
	return @"date";
}
+ (NSString *)imageURL {
	return @"imageURL";
}
+ (NSString *)locationLineOne {
	return @"locationLineOne";
}
+ (NSString *)locationLineTwo {
	return @"locationLineTwo";
}
+ (NSString *)missionDescription {
	return @"missionDescription";
}
+ (NSString *)missionID {
	return @"missionID";
}
+ (NSString *)phone {
	return @"phone";
}
+ (NSString *)timestamp {
	return @"timestamp";
}
+ (NSString *)title {
	return @"title";
}
@end

@implementation APSMissionUserInfo 
+ (NSString *)dateFormat {
	return @"YYYY-MM-DD'T'hh:mm:ss.sss'Z'";
}
@end

