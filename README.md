<!--
 * @Author: 余洋 yuyangit.0515@qq.com
 * @Date: 2024-10-18 13:02:23
 * @LastEditors: 余洋 yuyangit.0515@qq.com
 * @LastEditTime: 2024-10-23 20:51:38
 * @FilePath: /xy_opensource_env/README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# xy_opensource_env

- [简体中文](readme/README_zh_CN.md)
- [繁体中文](readme/README_zh_TW.md)
- [English](readme/README_en.md)

## 说明

希洋开源软件包运行环境.

## 源码仓库

- <a href="https://github.com/xy-base/xy_opensource_env.git" target="_blank">Github地址</a>  
- <a href="https://gitee.com/xy-base/xy_opensource_env.git" target="_blank">Gitee地址</a>

## 安装

```bash
# bash
docker pull yuyangit/xy-opensource-env:0.0.1
```

## 使用

```bash
# bash
docker run -itd --privileged --restart always --name xy_base -v <宿主路径>:<容器路径> yuyangit/xy-opensource-env:0.0.1
```

## 许可证
xy_opensource_env 根据 <木兰宽松许可证, 第2版> 获得许可。有关详细信息，请参阅 [LICENSE](LICENSE) 文件。

## 捐赠
如果小伙伴们觉得这些工具还不错的话，能否请咱喝一杯咖啡呢?  

![Pay-Total](./readme/Pay-Total.png)


## 联系方式

```
微信: yuyangiit
邮箱: yuyangit.0515@qq.com
```