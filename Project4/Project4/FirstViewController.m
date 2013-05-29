//
//  FirstViewController.m
//  Project4
//
//  Created by Jason Bentley on 5/25/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "FirstViewController.h"
#import "Pony.h"
#import "DetailsPonyViewController.h"
#import "XMLViewController.h"
#import "DataManager.h"


@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize objects, currentXMLValue, obj, requestStringtoPass;



- (void)viewDidLoad
{
    //instantiate singleton
    [DataManager initialize];
    
    
    //set our URL
    url = [[NSURL alloc] initWithString:@"http://ponyfac.es/api/tag/rainbow&dash&out=xml"];
    
    //request URL
    request = [[NSURLRequest alloc] initWithURL:url];
    
    if (request != nil) {
        //create connection init'd with our request (url)
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        //create mutabledata object
        requestData = [NSMutableData data];
          
    }
    
    //store our XML in NSData
    NSData *xmlData = [self GetFileDataFromFile:@"index.xml"];
  
    
    //parse
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    self.objects = [[NSMutableArray alloc] init];
    if (parser !=nil) {
        [parser setDelegate:self];
        [parser parse];
    }
    NSLog(@"%@", self.objects);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


//URL connection
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    if (data != nil)
    {
        //append data to requestData
        [requestData appendData:data];
        
    }
    
}

//after connection loads set dir path
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil) {
        NSLog(@"%@", requestString);
        [self setRequestStringtoPass:requestString];
        [[DataManager GetInstance] printSettings:requestStringtoPass];
    }
    
    //search for directory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //save path to string and write to file
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory !=nil) {
        NSString *fullPath = [[NSString alloc]initWithFormat:@"%@/%@", documentsDirectory, @"index.xml"];
        if (fullPath != nil) {
            [requestData writeToFile:fullPath atomically:YES];
        }
    }
}



//get data from file
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


//append string each time string is found
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    [self.currentXMLValue appendString:string];
}


//find first object in the XML and instantiate pony object
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    self.currentXMLValue = [[NSMutableString alloc] init];
    if ([elementName isEqualToString:@"item"]) {
        self.obj = [[Pony alloc] init];
    }
}


//set elements of object since there is no attr with this particular XML file
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if ([elementName isEqualToString:@"face_filename"]) {
        obj.name = self.currentXMLValue;
    }
    else if ([elementName isEqualToString:@"face_url"]) {
        obj.picUrl = self.currentXMLValue;
    }
    else if ([elementName isEqualToString:@"face_tags"]) {
        obj.tag = self.currentXMLValue;
    }
    else if ([elementName isEqualToString:@"face_thumbnail"]) {
        obj.thumbPicUrl = self.currentXMLValue;
    }
    else if ([elementName isEqualToString:@"item"]) {
        [self.objects addObject:obj];
    }
    
}



//count items in array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objects count];
}


//load reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Celli";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Pony *passed = [objects objectAtIndex:indexPath.row];
    
    //set cell text
    cell.textLabel.text = passed.name;
    
    
    //set cell thumb pics
    NSURL * imageURL = [NSURL URLWithString:passed.thumbPicUrl];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    thumb.image = image;
    
//    [cell.imageView setImage:
    
    return cell;
}


//segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PonyDetails"]) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Pony *ponySelected = [objects objectAtIndex:indexPath.row];
        
         DetailsPonyViewController *ponyDetails = (DetailsPonyViewController *)segue.destinationViewController;
        
        ponyDetails.ponyObject = ponySelected;
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
