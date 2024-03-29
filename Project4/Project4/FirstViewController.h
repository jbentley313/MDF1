//
//  FirstViewController.h
//  Project4
//
//  Created by Jason Bentley on 5/25/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pony.h"
#import "DataManager.h"

@interface FirstViewController : UITableViewController <UITableViewDelegate , NSURLConnectionDelegate, NSXMLParserDelegate>
{
    IBOutlet UITableView *tableView;
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *requestData;
    NSString *passThisXML;
   
    NSMutableArray *objects;
    NSMutableString *currentXMLValue;
    IBOutlet UIImageView *thumb;
    
}

@property NSMutableArray *objects;
@property NSMutableString *currentXMLValue;
@property(strong) Pony *obj;
@property NSString *requestStringtoPass;



@end
