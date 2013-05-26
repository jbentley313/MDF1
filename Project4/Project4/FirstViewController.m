//
//  FirstViewController.m
//  Project4
//
//  Created by Jason Bentley on 5/25/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    url = [[NSURL alloc] initWithString:@"http://ponyfac.es/api/all/tags&out=xml"];
    
    request = [[NSURLRequest alloc] initWithURL:url];
    
    if (request != nil) {
        //create connection init'd with our request (url)
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        //create mutabledata object
        requestData = [NSMutableData data];
        
    }
    
   
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




-(NSData*)GetFileDataFromFile:(NSString*)filename;
{
    NSString *filePath = nil;
    
    //create filemanage
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //get path to app directory
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =  [paths objectAtIndex:0];
    
    //create full path to data file
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    
    //does filename path exist?
    if ([fileManager fileExistsAtPath:filePath]) {
        //returns nsdata from file
        return [NSData  dataWithContentsOfFile:filePath];
        
    }
    return nil;
//    NSLog(@"%@", filePath);
}




//load reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Celli";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    BusinessInfo *passed = [businessesF objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = passed.businessName;
    
    return cell;
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    if (data != nil)
    {
        [requestData appendData:data];
    }
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil) {
        NSLog(@"%@", requestString);
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory !=nil) {
        NSString *fullPath = [[NSString alloc]initWithFormat:@"%@/%@", documentsDirectory, @"index.xml"];
        if (fullPath != nil) {
            [requestData writeToFile:fullPath atomically:YES];
            //            NSLog(@"%@", fullPath);
        }
    }
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
