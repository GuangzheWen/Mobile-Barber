# Objective C 入门课干货笔记

- Objective C & Swift 都学 当前企业级开发常用 & 未来

- C 与 OC 差异：
  - C   ：面向过程：强调数据、算法 数理逻辑
  - OC：面向对象：强调实例 现实逻辑 抽象为类 具象为对象
- 结构体：封装数据；函数：封装逻辑；类：Both
- 类组成：成员变量属性 + 方法
- Practice：OS X App Command Line Tool 新建文件



主程序入口，且.m后缀扩展名

main.m

```objective-c
// 头文件导入 import 导入库文件 并查重导入
// import “用户自定义文件”
// import <系统库文件>

// Foundation 框架 系统库包
// Foundation.h 包含常用类 结构体 类型等... 主头文件 NS开头
#import <Foundation/Foundation.h>

// 主函数程序入口
int main(int argc, const char * argv[]) {
  // 自动释放池：清理 动态分配 工厂方法创建的 对象
  @autoreleasepool { // 创建
    // Command + R 运行程序 Command + B 编译程序
    NSLog(@"Hello world.");
  } // 销毁
  return 0;
}

```



类 创建：

```objective-c
// 类的语法：声明 + 实现

// 声明
@interface 类名: 父类 {
  // 成员变量:在花括号中
  double _high;
  double _weight;
}

// 不能再声明时候写函数实现
// - 开头 实例方法
- (void)方法名;
// + 开头 类方法
  
  
  
// 结束
@end
  
//实现
@implementation 类名

- (void)类名 {
  printf("sth.");
}
  
@end
```



类使用：（实例）

```objective-c
类名* 指针变量名 = [[类名 alloc] init];
类名* 指针变量名 = [类名 new];
  
[指针变量名 实例方法名];
[类名 类方法名];
```



字符串类型

```objective-c
// 有自动换行 + 时间戳 + 工程名称
NSLog(@"hello world");
// 无自动换行
printf("Hello world");

/*
@“” 是OC的字符串类型 对象类型
“”  是C的字符串类型  集合类型
*/

// NextStep
// OC没有命名空间
```



接口分离：抽离类到独立文件

1. 把@interface 部分 放到 类名.h文件中 import <FOundation...>

2. 把@implementation 部分 放到 类名.m中 import "类名.h"
3. 在使用文件中加入 import “类名.h" 

实际操作：

1. Command  + N or New file
2. source » Cocoa Class

快捷键： ctrl + cmd + ↕️



```objective-c
struct 结构体名 {
  char* name;
  int age;
}

struct 结构体名 变量名 = {"dancer", 20}
变量名.name;
变量名.age;
```

```objective-c
// Student 结构体
// Person类
struct Student s1 = {"name", 20};
s1.name;

Person* xiaoMIng = [[Person alloc] init]; // 0 空 NULL nil对象空指针
// 受保护不能：xiaoming->_name; 
// 公开方式： getter setter
// getter
- (int)age;
- (int)age {
  return _age;
}
// setter
- (void)setAge:(int)age;
- (void)setAge:(int)age {
  _age = age;
}

[xiaoMing age];
[xiaoMing SetAge:19]

struct Student* ps1 = (struct Student *)malloc(sizeof(struct Student));
ps1->name;
```



```objective-c
NString* name = @"123";
NSInteger age = 10; // long type NSUInteger NSIntegerMax
```



```objective-c
// quickly add getter setter feature
// After @interface {}, write:
// 合成存储器 把成员变量生成属性，属性是为成员变量服务的，可以用.运算符访问
@property NSString * name; // no _ underline

// 在implementation里：写（可以省略）
@synthesize name;
// use %@ to print NSString type value
```



甚至！！使用@property属性拓展成员变量的话，{成员变量} 可以被删掉！

其实，是写@property 自动添加没有声明的成员变量 且命名规范 为 _属性名

当然了 可以自定义：@synthesize name = _myName;



NSInteger » %ld



注意：成员变量如歌按照官方命名规范，即使没有@property，也可以.语法访问





**属性关键字**

- 属性类型相关

assign 默认的 用于非对象类型的属性 值类型

retain 用于对象类型的属性

copy 多用于字符串类型的属性NSString



- 线程相关

nonatomic 默认的 单线程程序

atomic 多线程程序



- 访问权限相关

readonly 只getter

readwrite 默认getter setter



- 方法生成相关

getter 重命名getter

setter重命名setter



例子：A

```objective-c
@property(copy,nonatomic,readwrite) NSString* name;
@property(assign,nonatomic,readwrite) NSInteger age;
@property(assign,nonatomic,readonly) NSInteger money;
@property(copy,nonatomic,setter=GNAME,getter=GNAME) NSString* girlName;
使用时候相当于函数用[GNAME：12]
```

多参数函数

```objective-c
- (void)myNameAndAge:(NSString*)name:(NSInteger)age;
- (void)mySetName:(NSString*)name age:(NSInteger)age girlFriendName:(NSString*)girlName;
// 引用了标签的概念

- (void)showMessage;

学会抽象 归类
```



实例方法 对象

类型方法 仅  类型 不& 对象

```objective-c
+ (void)descriptionFunction;
+ (void)descriptionFunction {
  NSLog(@"1234567890");
}
```



介绍NSString

NSString是一个类

C语言的字符串是 字符序列

类的特征： 属性 + 方法

NSString 的属性和方法：

```objective-c
// 字符串的构建
// 不可变
NSString* str1 = @"123";
NSString* str2 = [[NSString alloc] initWithString:@"1234"];// 古老 被遗弃
NSString* str3 = [NSString stringWithString:str1];

// 可变字符串
NSMutableString* mStr1 = [[NSMutableString alloc] init];
[mStr1 appendString:@"dancer"];
showString(mStr1);
void showString(NSString* str){
  NSLog(@"str = %@", str);
}

[mStr1 appendString:@" so good"];
showString(mStr1);
str1.length;
mStr1.length;
// 字符串的长度 字符的个数 没有\n

NSString* nStr1 = [str1 stringByAppendingString:@"so good"];

@“dancer” 当作对象来处理 但不是对象。不存在与堆区 常量字符串
  
内置方法类型啥的 可以叫做API
  
```



例子：

```objective-c
struct Fraction {
  int top;
  int bottom;
};
typedef struct Fraction MFraction;
MFraction addFraction(MFraction num1, MFraction num2) {
  int newTop = num1.top*num2.bottom + num2.top*num1.bottom;
  int newBottom = num1.bottom*num2.bottom;
  
  MFraction newFraction = {newTop, newBottom};
  return MFraction;
}


```



