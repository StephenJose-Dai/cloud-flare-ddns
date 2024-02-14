# CloudFlareDDNS

#### 介绍
一个用于Padavan的Crontab的shell脚本，可以实现在Pdavan下的DDNS，可以同时实现ipv4和ipv6的DDNS。

#### 软件架构
一个shell脚本，用于Pdavan路由系统的，应该算是Busybox吧，有别于CentOS，好像是两者有一些命令上的区别。


#### 使用说明
###### 1、先到https://cloudflare.com上创建个API 令牌并记录令牌值，然后获取Global API Key和ZoneID(ZoneID就是所谓的区域ID）  

###### 2、修改GetRecordId.sh中的{ZONE_ID}为自己的ZoneID值，{API_TOKEN}为刚才创建的API令牌记录下来的值，不是Global API Key，切记。  

###### 3、修改“auth_email”、“auth_key”、“zone_id”、“record_name”和IPV4的“local record_id”以及IPV6的“local record_id”六个参数的值。    

详细使用文档请访问 https://daishenghui.club/2024/02/14/categories/Linux/K2-Padavan-Cloudflare%E5%AE%9E%E7%8E%B0DDNS/ 进行查看

#### 参与贡献

###### 1、感谢<a target="_blank" href="https://typecho.index0.cn/">Tak</a>提供的技术协助

###### 2、感谢<a target="_blank" href="https://www.zwyktech.cn/">福建省智网云科科技有限公司</a>提供的技术支持和硬件支持

#### 公众号
![戴戴的Linux微信公众号](wcqrc/ddlnxqrcimg.jpg)

![戴戴的Linux微信公众号](wcqrc/zwykqrcimg.jpg)

#### 链接
https://daishenghui.club  

https://dh.daishenghui.club  

https://www.zwyktech.cn  

