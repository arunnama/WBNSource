//
//  HTTPHelper.h
//  Ckure
//
//  Created by KH1386 on 3/6/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPHelper : NSObject<NSURLSessionDelegate>
{
    NSURLSessionConfiguration *defaultConfigObject;
    NSURLSession *defaultSession;
}
+(id) sharedObj;

-(void) get:(NSString*)urlStr completion:(void(^)(NSData * resp))callback;
-(void) get1:(NSString *)urlStr completion:(void (^)(NSData *))callback;

-(id) convertJSONToObject:(NSData*)data;
-(NSString *) convertObjToSJON:(id)obj;

-(void) post:(NSString*) urlStr formData:(NSDictionary*)params completion:(void(^)(NSData * resp))callback;

- (void) speechToText:(NSData *)byteData completion:(void(^)(NSString * resp))callback;

@end
