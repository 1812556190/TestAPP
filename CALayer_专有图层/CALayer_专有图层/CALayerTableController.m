//
//  ViewController.m
//  CALayer_专有图层
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "CALayerTableController.h"
#import "AppMrco.h"

#import "CALayerDatas.h"
@interface CALayerTableController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong)NSArray *vcArrays;

@end

@implementation CALayerTableController


- (NSArray *)vcArrays{
    if (!_vcArrays) {
        _vcArrays = @[@"CAShapeLayer",
                      @"CATextLayer",
                      @"CAGradientLayer",
                      @"CAEmitterLayer",
                      @"AVPlayerLayer"];
    }
    return _vcArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect tableViewFrame = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.vcArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.textLabel.text = self.vcArrays[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LayerType type = indexPath.row;
    CALayerDatas *layerVc = [[CALayerDatas alloc] init];
    layerVc.typeLayer = type;
    [self.navigationController pushViewController:layerVc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
