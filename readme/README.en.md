<!--
 * @Author: 余洋 yuyangit.0515@qq.com
 * @Date: 2024-10-18 13:02:22
 * @LastEditors: 余洋 yuyangit.0515@qq.com
 * @LastEditTime: 2024-10-23 20:52:22
 * @FilePath: /xy_opensource_env/readme/README.en.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# xy_opensource_env

| [简体中文](../README.md)         | [繁體中文](./README.zh-hant.md)        |                      [English](./README.en.md)          |
| ----------- | -------------|---------------------------------------|

## Description

xy open source software package operating environment.

## Source Code Repositories

| [Github](https://github.com/xy-base/xy_opensource_env.git)         | [Gitee](https://gitee.com/xy-opensource/xy_opensource_env.git)        |                      [GitCode](https://gitcode.com/xy-opensource/xy_opensource_env.git)          |
| ----------- | -------------|---------------------------------------|
 

## Installation

```bash
# bash
docker pull yuyangit/xy_opensource_env:latest
```

## How to use

###### 1. Build Image

```bash
# bash
sh ./build.sh
```

##### 2. Run Container

```bash
# bash
docker run -itd --privileged --restart always --name xy_base -v <host path>:<container path> yuyangit/xy_opensource_env:latest
```

## License
xy_opensource_env is licensed under the <Mulan Permissive Software License，Version 2>. See the [LICENSE](../LICENSE) file for more info.

## Donate

If you think these tools are pretty good, Can you please have a cup of coffee?  

![pay-total](./pay-total.png)  


## Contact

```
WeChat: yuyangiit
Mail: yuyangit.0515@qq.com
```