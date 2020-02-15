Docker Tool box 是上一代的运行平台.
toolbox 自带一个 virtualbox 的驱动, 能够生成一个 virtualbox 的虚拟机,作为 Docker deamon 的运行使用. 一般设置 2G 内存 进行运行.

安装完成 Toolbox 后会有一个 Docker Quickstart Terminal 的快捷方式，双击运行如果报错，那可能是因为你已经安装了 Hyper-v，所以 VirtualBox 无法用64位的虚拟机。需要卸载 Hyper-v。

Docker Quickstart Terminal 使用 Git 的 bash 环境作为启动脚本(右键快捷方式图标, 指定 git 的 bash 路径)

$ docker-machine ls
$ docker-machine ip default

运行后会在 Virtualbox 中创建一个叫做 default 的虚拟机，用户名/docker, 密码/tcuser

通过 docker 启动容器后可能无法通过宿主机访问容器网络, 因为 VirtualBox 默认使用 NAT 网络, 需在 VirtualBox 网络选项中添加虚拟端口转发, 转发的目的 ip 是 docker-machine ip default 显示的 ip, 端口是启动容器时指定的镜像端口

当遇到 docker pull 拉去不到镜像时需修改 windows dns 服务器为 8.8.8.8(首选) 和 8.8.4.4(备选)