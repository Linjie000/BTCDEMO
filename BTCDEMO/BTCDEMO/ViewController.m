//
//  ViewController.m
//  BTC_demo
//
//  Created by fk on 2018/9/27.
//  Copyright © 2018年 fk. All rights reserved.
//

#import "ViewController.h"
#import <BTCWrapper/BTCWrapper.h>


@interface ViewController ()
{
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;

    
    IBOutlet UITextField *textField;
    IBOutlet UILabel *label3;

    IBOutlet UITextField *textField2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}



//有兴趣的加微信：angryperson（每人150元），里面有此静态库源文件



//创建
-(IBAction)createAddress{
    
    [BTCWrapper createAccountWithBlock:^(NSString *private, NSString *address, NSString *words) {
        NSLog(@"私钥：%@",private);
        NSLog(@"地址：%@",address);
        NSLog(@"助记词：%@",words);
        
        
        self->label1.text = private;
        self->label2.text = address;
    }];
    
}



//导入私钥
-(IBAction)importPrivate:(id)sender{
 
    [BTCWrapper importPrivateKey:textField.text?textField.text:@"L2fjx5mJWhpfLoGn7U93vJZdPHKUw7faXZEw3gYEdns1bEstuLZ9" success:^(NSString *private, NSString *address) {
        NSLog(@"%@----%@",private,address);
        self->label3.text = address;

    } error:^{
        
    }];
}

//导入助记词
-(IBAction)importMnemonic:(id)sender{
    
    
    [BTCWrapper importMnemonic:textField2.text success:^(NSString *private, NSString *address) {
        NSLog(@"%@----%@",private,address);
        self->label3.text = address;
        
    } error:^{
        
    }];
}

//https://www.blockchain.com/btc/address/1CaD5Dtjmu72UMgdKRw3pJmB6qQGkf4zFF
//查询余额
-(IBAction)getBalance:(id)sender{
    
    [BTCWrapper getBalanceWithAddress:@"1CaD5Dtjmu72UMgdKRw3pJmB6qQGkf4zFF" block:^(NSDictionary *dict, BOOL suc) {
        NSLog(@"%@",dict);
    }];
}


//交易记录
-(IBAction)getTx:(id)sender{
    [BTCWrapper getTxlistWithAddress:@"1CaD5Dtjmu72UMgdKRw3pJmB6qQGkf4zFF" withPage:1 block:^(NSArray *array, BOOL suc) {
        NSLog(@"%@",array);
    }];
}


//转账
-(IBAction)send:(id)sender{
    [BTCWrapper sendToAddress:@"1Eqd4DyVrFgYE1UWsPE7Vapx9d8g36mBL3" money:@"0.00001" fromAddress:@"1CaD5Dtjmu72UMgdKRw3pJmB6qQGkf4zFF" privateKey:@"L5k1BWGvSu5bJfRR5cqbim6LSU3GgpRCH2aywWBrQTwteADbR1W2" fee:35 block:^(NSString *hashStr, BOOL suc) {
        
    }];
}


@end
