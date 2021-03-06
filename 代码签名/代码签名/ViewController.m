//
//  ViewController.m
//  代码签名
//
//  Created by 赵鹏 on 2018/12/12.
//  Copyright © 2018 赵鹏. All rights reserved.
//

/**
 代码签名：代码签名是对可执行文件或脚本进行数字签名，用来确认软件在签名后未被修改或损坏的措施。和数字签名原理一样，只不过签名的数据是代码而已。
 
 苹果通过代码签名的措施保证了每一个安装到苹果手机上的APP都是经过苹果官方允许的。这就分为了两种情况，第一种情况是APP发布后从APP Store上下载，然后安装到手机上的。第二种情况是在开发过程中，开发人员真机调试的时候或者使用企业证书把APP装到手机上的。
 上述的第一种情况：苹果官方用非对称加密算法生成一对公钥和私钥，在手机的iOS系统中内置一个公钥，私钥则由苹果的后台保存。开发人员将开发好的APP上传到AppStore时，苹果后台用私钥对这个APP数据进行签名，当手机下载这个APP后，用公钥验证这个签名，如果签名正确，则这个APP肯定是由苹果后台认证的并且没有被修改过，也就达到了苹果的需求：保证苹果手机上安装的每一个APP都是经过苹果官方允许的。
 上述的第二种情况：苹果针对这种情况，给出了一个解决方案，叫做“双层签名”。在开发者的Mac电脑中Xcode会利用非对称加密算法生成一对公钥和私钥，在这里称为公钥M和私钥M。苹果官方也会生成一对公钥和私钥，在这里称为公钥A和私钥A，苹果把私钥A放在苹果后台的服务器上，把公钥A放在每台苹果手机上。想要真机调试的时候，把Mac电脑上的公钥M和一些开发者的信息组成CSR文件，然后把CSR文件发送给苹果的后台服务器，得到一份包含了经过苹果后台的私钥A加密过后的证书，这个证书中包含公钥M以及它的签名。在开发时，编译完一个APP后，用Mac电脑中的本地私钥M（.p12文件）对这个APP的可执行文件"MachO"进行签名，然后把MachO文件、MachO文件的签名以及之前得到的证书一起打包放到.ipa文件中，然后安装到手机上。在安装时手机上的公钥A把证书进行解密，从而可以得到公钥M，公钥M又可以验证APP的签名，如果验证成功的话就会得到MachO文件。
 
 描述文件(Provisioning profile)：苹果为了解决应用滥用的问题，所以又加了两个限制。第一个限制是在苹果后台注册过的设备才可以安装。第二个限制是签名只能针对某一个具体的APP。除了上述的两个限制外，苹果还想控制App里面的iCloud/PUSH/后台运行/调试器等这些权限，所以苹果把这些权限开关统一称为授权文件(Entitlements)，并将这个文件放在了一个叫做描述文件(Provisioning Profile)的文件中，这个描述文件需要开发者在苹果的开发者网站上进行申请。


 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
