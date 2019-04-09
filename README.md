# flutter_share_go

A Flutter plugin support share to facebook and twitter.
一个支持分享到facebook和twitter的插件

## Getting Started

- import plugin
- 导入库

```
import 'package:flutter_share_go/flutter_share_go.dart';

```

- example
- 例子

```
//share to facebook 分享到facebook
FlutterShareGo.shareToFBPlatform("test share to fb content", "http://tryenough.com");

```


```
//share to twitter 分享到twitter
FlutterShareGo.shareToTwitterPlatform("test share to twitter content", "http://tryenough.com");

```

欢迎大家支持我的网站
[网站](https://tryenough.com),

注意：

iOS上使用时需要适配iOS9，在iOS文件夹下的Runner文件下的Info.plist文件中增加如下配置：(不明白可以看文章：http://tryenough.com/ios-installcheck)

```
<key>LSApplicationQueriesSchemes</key>
    <array>
        <string>fb</string>
        <string>twitter</string>
    </array>
```