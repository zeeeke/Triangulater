//
//  ViewController.m
//  Triangulator
//
//  Created by Zeke Shearer on 3/14/15.
//  Copyright (c) 2015 Zeke Shearer. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "UIColor+RSSI.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate>

@property (nonatomic, strong) NSMutableArray *peripherals;
@property (nonatomic, strong) NSMutableDictionary *RSSIForPeripherals;
@property (nonatomic, strong) CBCentralManager *centralManager;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

   
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    self.peripherals = [NSMutableArray array];
    self.RSSIForPeripherals = [NSMutableDictionary dictionary];
}

#pragma mark - Central Manager Delegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    if ( central.state == CBCentralManagerStatePoweredOn ) {
        [central scanForPeripheralsWithServices:nil options:nil];
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    [self.RSSIForPeripherals setObject:RSSI forKey:peripheral];
    if ( ![self.peripherals containsObject:peripheral] ) {
        [self.peripherals addObject:peripheral];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.peripherals.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.peripherals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    CBPeripheral *peripheral;
    NSInteger RSSI;

    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    peripheral = self.peripherals[indexPath.row];
    RSSI = [self.RSSIForPeripherals[peripheral] integerValue];
    cell.textLabel.text = peripheral.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", (long)RSSI];
    cell.contentView.backgroundColor = [UIColor colorWithRSSI:RSSI];
    
    return cell;
}

@end
