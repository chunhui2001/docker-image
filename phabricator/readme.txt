
### 在Phabricator的主面板中主要有以下几个工具：
-- Differential 	– Review Code：					管理 pre-push code review 工作流程；
-- Maniphest 		– Task and Bugs：				管理成员的所有任务和Bug，可对任务或Bug展开讨论；
-- Diffusion 		– Host and Browse Repositories：	管理代码仓库，支持Git/Hg/SVN；
-- Audit 			– Browse and Audit Commits：		管理 post-push code review 工作流程；
-- Phriction 		– Wiki：							文档管理；
-- Projects 		– Get Organized：				工程管理，可关联Repository；

### Phabricator搭建 
https://chenjiehua.me/linux/phabricator-setup.html

### Installation Guide
https://secure.phabricator.com/book/phabricator/article/installation_guide/

### Installing Phabricator on Ubuntu 20.04
https://manoramahp.medium.com/installing-phabricator-on-ubuntu-20-04-4a3e0f90acf8
git clone https://github.com/phacility/libphutil.git
git clone https://github.com/phacility/arcanist.git
git clone https://github.com/phacility/phabricator.git

### set auth provider and then:
$ ./bin/auth lock

### 启动phd进程池，同步远程代码库要用
$ ./bin/phd start

### Configuring File Storage 配置存储引擎
https://secure.phabricator.com/book/phabricator/article/configuring_file_storage/

### Arcanist User Guide
https://secure.phabricator.com/book/phabricator/article/arcanist/

### Arcanist Quick Start
https://secure.phabricator.com/book/phabricator/article/arcanist_quick_start/

# 设置默认编辑器
$ arc set-config editor "vim"

# 设置 arc token
$ arc install-certificate
> cat ~/.arcrc 

$ arc diff <tag_name_here>


### Configure Git Server with HTTP on Ubuntu
https://linuxhint.com/git_server_http_ubuntu

### Diffusion 用户指南：存储库托管
https://secure.phabricator.com/book/phabricator/article/diffusion_hosting/

### phabricator配置远程仓库并实现code_review
http://www.manongjc.com/detail/27-mhidkavaehvtvtj.html

