//
//  HTTPHelper.m
//  Ckure
//
//  Created by KH1386 on 3/6/14.
//  Copyright (c) 2014 KH1386. All rights reserved.
//

#import "HTTPHelper.h"
#import "Datahandler.h"

@implementation HTTPHelper

+(id) sharedObj
{
    static HTTPHelper *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[HTTPHelper alloc] init];
    });
    return sharedMyManager;
}
-(id) init
{
    self =[super init];
    if(self)
    {
        defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
        
    }
    return self;
}
-(void) get1:(NSString *)urlStr completion:(void (^)(NSData *))callback
{
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
  
    NSLog(@"Sending Requst =%@",urlRequest);
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setTimeoutInterval:60];
    
//    [urlRequest setHTTPBody:content];
    
//    NSLog(@"Sending Data =%@",[[NSString alloc] initWithData:content  encoding: NSUTF8StringEncoding]);
    
    NSURLResponse * response=nil;
    NSError * error =nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    int statusCode = [httpResponse statusCode];
    
    NSLog(@"Status code =%d",statusCode);
    NSLog(@"Data Received =%@",[[NSString alloc] initWithData:data  encoding: NSUTF8StringEncoding]);
    
    
    if(error == nil)
    {
        NSHTTPURLResponse *httpResponse =(NSHTTPURLResponse*) response;
        if(httpResponse.statusCode == 200)
        {
            callback(data);
        }
        else
        {
            
        }
        
    }
    else
        callback(nil);

    
}
-(void) get:(NSString*)urlStr completion:(void(^)(NSData * resp))callback
{
    NSURL * url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setTimeoutInterval:60];
/*    if([[Datahandler sharedObj] getCookieValue])
    {
        [urlRequest setValue:[[Datahandler sharedObj] getCookieValue] forHTTPHeaderField:@"Set-Cookie"];
    }*/
    

    NSLog(@"Sending request to URL =%@",url);
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       NSLog(@"Response =%@",response);
        NSString * text = [[NSString alloc] initWithData: data encoding:NSASCIIStringEncoding];
        

       // NSLog(@"Data = %@",text);

        if(error == nil)
        {
            NSHTTPURLResponse *httpResponse =(NSHTTPURLResponse*) response;
            if(httpResponse.statusCode == 200)
            {
                callback([text dataUsingEncoding:NSUTF8StringEncoding]);
            }
            else
            {
                
            }
//            NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
//            NSLog(@"Data = %@",text);
        }
         else{
             callback(nil);
         }
                                                        
    }];
    
    [dataTask resume];
    
}
-(void) post:(NSString*) urlStr formData:(NSDictionary*)params completion:(void(^)(NSData * resp))callback
{
    NSURL * url = [NSURL URLWithString:urlStr];

    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString * paramsStr=@"";
    NSArray * keys=[params allKeys];
    for(int i=0;i<keys.count;i++)
    {
        NSString * key =[keys objectAtIndex:i];
        NSString * value =[params objectForKey:key];
        paramsStr = [paramsStr stringByAppendingFormat:@"%@=%@&",key,value];
    }
    

   /* if([[Datahandler sharedObj] getCookieValue])
    {
        [urlRequest setValue:[[Datahandler sharedObj] getCookieValue] forHTTPHeaderField:@"Set-Cookie"];
    }*/
    
    [urlRequest setTimeoutInterval:60];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[paramsStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"Sending Request to %@",url);
    NSLog(@"FormData %@",paramsStr);
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
    NSLog(@"Response:%@ %@\n", response, error);
           NSLog(@"Request:%@ %@\n", urlRequest, error);
//        NSDictionary* headers = [(NSHTTPURLResponse *)response allHeaderFields];
        
//        if([headers objectForKey:@"Set-Cookie"])
//            [[Datahandler sharedObj]  setCookieValue:[headers objectForKey:@"Set-Cookie"]];
        
        NSString * text = [[NSString alloc] initWithData: data encoding:NSASCIIStringEncoding];
         if(error == nil)
         {
             callback([text dataUsingEncoding:NSUTF8StringEncoding]);
         }else
         {
             callback(nil);
         }
         
     }];
    [dataTask resume];
    
}
-(id) convertJSONToObject:(NSData*)data
{
    NSError* err = nil;
    id ret= [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                               error:&err];
    if(err != nil)
    {
        NSLog(@"Unable to convert to JSON");
    }

    return ret;
}
-(NSString *) convertObjToSJON:(id)obj
{
    NSError* err = nil;
    
    NSData * data =[NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&err];
    if(err != nil)
    {
        NSLog(@"Unable to convert to JSON");
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (void) speechToText:(NSData *)byteData completion:(void(^)(NSString * resp))callback
{
    NSURL *url = [NSURL URLWithString:@"http://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyCnl6MRydhw_5fLXIdASxkLJzcJh5iX0M4"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:byteData];
    [request addValue:@"audio/x-flac; rate=44100;" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.117 Safari/537.36" forHTTPHeaderField:@"User-Agent"];
    [request setURL:url];
    [request setTimeoutInterval:15];
  
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:request
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
         NSLog(@"Response:%@ %@\n", response, error);
         if(error == nil)
         {
             
             NSString * str =[[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
             NSArray * arr =[str componentsSeparatedByString:@"\n"];
             for(NSString * item in arr)
             {
                 NSDictionary * dict =[self convertJSONToObject:[item dataUsingEncoding:NSUTF8StringEncoding]];
                 if(dict != nil)
                 {
                     NSInteger index =0;
                     NSArray * results =[dict objectForKey:@"result"];
                     if(results && results.count > 0)
                     {
                         // NSLog(@"Result =%@",results);
                         NSNumber *indexNum =[dict valueForKey:@"result_index"];
                         if(indexNum)
                         {
                             //  index = [indexNum integerValue];
                         }
                         //  NSLog(@"INdex number =%@",indexNum);
                         
                         NSDictionary * mainDict=[results objectAtIndex:index];
                         
                         //  NSLog(@"Main dict =%@",mainDict);
                         if([mainDict objectForKey:@"alternative"])
                         {
                             NSArray * tempArr =[mainDict objectForKey:@"alternative"];
                             
                             //     NSLog(@"tempArr =%@",tempArr);
                             if(tempArr)
                             {
                                 NSDictionary * finalDict =[tempArr objectAtIndex:index];
                                 //       NSLog(@"Final dict =%@",finalDict);
                                 
                                 NSString * text =[finalDict objectForKey:@"transcript"];
                                 
                                 //       NSLog(@"Final text =%@",text);
                                 callback(text);
                                 return;
                             }
                         }
                         
                     }
                     else
                     {
                         NSLog(@"Invalid result =%@",dict);
                     }
                 }
             }
             
             
         }
        
        callback(nil);
        
    }];
    [dataTask resume];
    
    
  /*  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(error == nil)
    {
        
        
        NSString * str =[[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
        NSArray * arr =[str componentsSeparatedByString:@"\n"];
        for(NSString * item in arr)
        {
            NSDictionary * dict =[self convertJSONToObject:[item dataUsingEncoding:NSUTF8StringEncoding]];
            if(dict != nil)
            {
                NSInteger index =0;
                NSArray * results =[dict objectForKey:@"result"];
                if(results && results.count > 0)
                {
                   // NSLog(@"Result =%@",results);
                    NSNumber *indexNum =[dict valueForKey:@"result_index"];
                    if(indexNum)
                    {
                        //  index = [indexNum integerValue];
                    }
                  //  NSLog(@"INdex number =%@",indexNum);
                    
                    NSDictionary * mainDict=[results objectAtIndex:index];
                    
                  //  NSLog(@"Main dict =%@",mainDict);
                    if([mainDict objectForKey:@"alternative"])
                    {
                        NSArray * tempArr =[mainDict objectForKey:@"alternative"];
                        
                   //     NSLog(@"tempArr =%@",tempArr);
                        if(tempArr)
                        {
                            NSDictionary * finalDict =[tempArr objectAtIndex:index];
                     //       NSLog(@"Final dict =%@",finalDict);
                            
                            NSString * text =[finalDict objectForKey:@"transcript"];
                            
                     //       NSLog(@"Final text =%@",text);
                            return text;
                        }
                    }
                    
                }
                else
                {
                    NSLog(@"Invalid result =%@",dict);
                }
            }
        }
    }
    */
  //  NSLog(@"ERROR %@",[error debugDescription]);
}


@end
