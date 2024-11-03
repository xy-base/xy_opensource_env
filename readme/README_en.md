<!--
 * @Author: 余洋 yuyangit.0515@qq.com
 * @Date: 2024-10-18 13:02:22
 * @LastEditors: 余洋 yuyangit.0515@qq.com
 * @LastEditTime: 2024-10-23 20:52:22
 * @FilePath: /xy-web-service/readme/README_en.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# xy-web-service

- [简体中文](README_zh_CN.md)
- [繁体中文](README_zh_TW.md)
- [English](README_en.md)

## Description

xy-web-service服务环境.

## Source Code Repositories

- <a href="https://github.com/xy-web-service/xy-web-service.git" target="_blank">Github</a>  
- <a href="https://gitee.com/xy-web-service/xy-web-service.git" target="_blank">Gitee</a>

## Installation

<!-- ```bash
# bash
pip install xy-web-service
``` -->

## How to use

```python
# main.py
from xy-web-service.WebWork import WebWork as xyWebWork
from xy-web-service.Settings.Settings import Settings

class WebServerWork(xyWebWork):
    settings: Settings | None = Settings()

    prog: str = "xy_test_demo"
    description: str = f""">>>>>>>>>>>> xy_test_demo - v1.0.0 <<<<<<<<<<<<<"""

if __name__ == "__main__":
    web_server_work = WebServerWork()
    web_server_work.main()
```

```bash
# bash
python main.py -c project -n xy-web-service_demo
# 创建项目 [ xy-web-service_demo ] 成功!!!
# 项目路径 ==>>> /mnt/bs-media/Workspace/project/opensource/xy-web-service/xy-web-service/test/xy-web-service_demo
```

## License
xy-web-service is licensed under the <Mulan Permissive Software License，Version 2>. See the [LICENSE](../LICENSE) file for more info.

## Donate

If you think these tools are pretty good, Can you please have a cup of coffee?  

![Pay-Total](./Pay-Total.png)  


## Contact

```
WeChat: yuyangiit
Mail: yuyangit.0515@qq.com
```