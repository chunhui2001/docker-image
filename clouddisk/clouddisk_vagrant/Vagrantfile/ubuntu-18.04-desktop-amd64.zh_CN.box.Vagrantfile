# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "chunhuizhang/ubuntu-18.04-desktop-amd64.zh_CN"
  config.vm.define "ubuntu-x18.04.desktop"
  config.vm.hostname = "ubuntu-x18.04.desktop"

  # 该指令可调整默认磁盘大小, 需安装插件 vagrant-disksize
  # $ vagrant plugin install vagrant-disksize
  config.disksize.size = "20GB"

  # config.ssh.username = "ubuntu"
  # config.ssh.forward_agent = true
  # config.ssh.insert_key = false
  # config.ssh.password="Cc"

  # config.vm.network "forwarded_port", guest: 80, host:11180
  # config.vm.network "forwarded_port", guest: 8080, host:18080
  # config.vm.network "forwarded_port", guest: 8081, host:18081
  # config.vm.network "forwarded_port", guest: 9181, host:19181

  config.vm.provider "virtualbox" do |vb|
    vb.name   = "ubuntu-x18.04.desktop"    
    vb.gui    = true        
    vb.memory = "4096"    
    vb.cpus   = 2       
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected" ]   
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
end
