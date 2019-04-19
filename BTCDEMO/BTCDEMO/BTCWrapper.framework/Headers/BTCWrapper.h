//
//  BTCWrapper.h
//  BTCWrapper.h
//
//  Created by 闪链 on 2019/4/19.
//  Copyright © 2019 lyj. All rights reserved.
//

#import <Foundation/Foundation.h>



@class BTCMnemonic;

@interface BTCWrapper : NSObject


//创建
+(void)createAccountWithBlock:(void(^)(NSString *private,NSString *address,NSString *words))block;

//导入
+(void)importPrivateKey:(NSString *)privateKey
                success:(void(^)(NSString *private,NSString *address))successblock
                  error:(void(^)(void))errorblock;
//导入助记词
+(void)importMnemonic:(NSString *)string
              success:(void(^)(NSString *private,NSString *address))successblock
                error:(void(^)(void))errorblock;

+(BTCMnemonic *)generateMnemonicPassphrase:(NSString *)phrase withPassword:(NSString *)password;



+(NSString *)getPassphraseByMnemonic:(BTCMnemonic *)mnemonic;


//查询余额
+(void)getBalanceWithAddress:(NSString *)address
                       block:(void(^)(NSDictionary *dict,BOOL suc))block;

////查询交易记录
+(void)getTxlistWithAddress:(NSString *)address
                   withPage:(NSInteger)page
                      block:(void(^)(NSArray *array,BOOL suc))block;
 
//交易  fee 为 fee sat/b
+(void)sendToAddress:(NSString *)toAddress money:(NSString *)money fromAddress:(NSString *)fromAddress privateKey:(NSString *)privateKey fee:(NSInteger)fee block:(void(^)(NSString *hashStr,BOOL suc))block;



@end

