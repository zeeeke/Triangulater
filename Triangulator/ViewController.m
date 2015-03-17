//
//  ViewController.m
//  Triangulator
//
//  Created by Zeke Shearer on 3/14/15.
//  Copyright (c) 2015 Zeke Shearer. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate>

@property (nonatomic, strong) NSMutableArray *peripherals;
@property (nonatomic, strong) CBCentralManager *centralManager;
   
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

#pragma mark - Central Manager Delegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.peripherals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
