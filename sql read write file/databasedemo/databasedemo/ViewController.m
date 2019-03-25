//
//  ViewController.m
//  databasedemo
//
//  Created by Yogesh Patel on 13/09/17.
//  Copyright © 2017 Yogesh Patel. All rights reserved.
//

#import "ViewController.h"
#import "dboperation.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize arrmaindata,txtcity,txtname,tableview;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[NSFileManager defaultManager] createFileAtPath:@"/Users/run/Desktop/doc.txt" contents:nil attributes:nil];
    
    
    //write file
    NSFileHandle *file;
    NSMutableData *data;
    
    const char *bytestring = "black dog";
    
    data = [NSMutableData dataWithBytes:bytestring length:strlen(bytestring)];
    
    
    file = [NSFileHandle fileHandleForUpdatingAtPath:@"/Users/run/Desktop/doc.txt"];
    
    if (file == nil)
        NSLog(@"Failed to open file");
    
    
    [file seekToFileOffset: 10];
    
    [file writeData: data];
    
    [file closeFile];
    
    
    //read file
    NSFileHandle *file1;
    NSData *databuffer;
    
    file1 = [NSFileHandle fileHandleForReadingAtPath: @"/Users/run/Desktop/doc.txt"];
    
    if (file1 == nil)
        NSLog(@"Failed to open file");
    
    [file1 seekToFileOffset: 10];
    
    databuffer = [file1 readDataToEndOfFile];
    NSString *output = [[NSString alloc]initWithData:databuffer
                                            encoding:NSUTF8StringEncoding];
    
    NSLog(@"Noi dung la: %@", output);
    [file1 closeFile];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnsave:(id)sender
{
    NSString *strsave = [[NSString alloc]initWithFormat:@"insert into studinfo values('%@','%@')",txtname.text,txtcity.text];
    dboperation *ds = [[dboperation alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is save");
    }
    else
    {
        NSLog(@"data is not save");
    }
}

- (IBAction)btnupdate:(id)sender
{
    NSString *strsave = [[NSString alloc]initWithFormat:@"update studinfo set city='%@' where name='%@'",txtcity.text,txtname.text];
    dboperation *ds = [[dboperation alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is Update");
    }
    else
    {
        NSLog(@"data is not update");
    }

}

- (IBAction)btndelete:(id)sender
{
    NSString *strsave = [[NSString alloc]initWithFormat:@"delete from studinfo where name = '%@'",txtname.text];
    dboperation *ds = [[dboperation alloc]init];
    BOOL st = [ds getalluser:strsave];
    if (st)
    {
        NSLog(@"data is Deleted");
    }
    else
    {
        NSLog(@"data is not deleted");
    }
    

}

- (IBAction)btnshow:(id)sender
{
    NSString *strshow = [[NSString alloc]initWithFormat:@"select * from studinfo"];
    dboperation *ds = [[dboperation alloc]init];
    arrmaindata = [[NSMutableArray alloc]init];
    arrmaindata = [ds getalluser:strshow];
    [tableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrmaindata.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"name"];//name field textlabel store
    cell.detailTextLabel.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"city"];//detail text city data store
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    txtname.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"name"];//textfieldname
    txtcity.text=[[arrmaindata objectAtIndex:indexPath.row]objectForKey:@"city"];//textfieldcity
}




@end
