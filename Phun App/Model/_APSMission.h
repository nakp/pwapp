// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APSMission.h instead.

@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface APSMissionID : NSManagedObjectID {}
@end

@interface _APSMission : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) APSMissionID*objectID;

@property (nonatomic, strong, nullable) NSDate* date;

@property (nonatomic, strong, nullable) NSString* imageURL;

@property (nonatomic, strong, nullable) NSString* locationLineOne;

@property (nonatomic, strong, nullable) NSString* locationLineTwo;

@property (nonatomic, strong, nullable) NSString* missionDescription;

@property (nonatomic, strong) NSNumber* missionID;

@property (atomic) int16_t missionIDValue;
- (int16_t)missionIDValue;
- (void)setMissionIDValue:(int16_t)value_;

@property (nonatomic, strong, nullable) NSString* phone;

@property (nonatomic, strong, nullable) NSDate* timestamp;

@property (nonatomic, strong, nullable) NSString* title;

@end

@interface _APSMission (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;

- (NSString*)primitiveLocationLineOne;
- (void)setPrimitiveLocationLineOne:(NSString*)value;

- (NSString*)primitiveLocationLineTwo;
- (void)setPrimitiveLocationLineTwo:(NSString*)value;

- (NSString*)primitiveMissionDescription;
- (void)setPrimitiveMissionDescription:(NSString*)value;

- (NSNumber*)primitiveMissionID;
- (void)setPrimitiveMissionID:(NSNumber*)value;

- (int16_t)primitiveMissionIDValue;
- (void)setPrimitiveMissionIDValue:(int16_t)value_;

- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;

- (NSDate*)primitiveTimestamp;
- (void)setPrimitiveTimestamp:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

@end

@interface APSMissionAttributes: NSObject 
+ (NSString *)date;
+ (NSString *)imageURL;
+ (NSString *)locationLineOne;
+ (NSString *)locationLineTwo;
+ (NSString *)missionDescription;
+ (NSString *)missionID;
+ (NSString *)phone;
+ (NSString *)timestamp;
+ (NSString *)title;
@end

@interface APSMissionUserInfo: NSObject 
+ (NSString *)dateFormat;
@end

NS_ASSUME_NONNULL_END
