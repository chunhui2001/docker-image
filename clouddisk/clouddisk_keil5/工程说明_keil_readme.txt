十六进制 0-9
0x30 0
0x31 1
0x32 2
0x33 3
0x34 4
0x35 5
0x36 6
0x37 7
0x38 8
0x39 9

在 Keil5 中打开 BOOTLOADER 项目 (用Keil打开 *.uvprojx 结尾的文件

>> 4.0 车机BOOT工程
C:\Users\wudy\Downloads\Gofun_JuKe\code4.0_20190912\BOOT\Rvmdk\Gofun_TBOX4_UBOOT.uvprojx

>> 4.0 车机工程
C:\Users\wudy\Downloads\Gofun_JuKe\code4.0_20190912\Rvmdk\Gofun_TBOX4.uvprojx

>> 2.0 车机工程
C:\Users\wudy\Downloads\Gofun_JuKe\code2.0_20191011\Rvmdk\Gofun_UCOS-2G.uvproj

>> 1.0 车机工程
C:\Users\wudy\Downloads\Gofun_JuKe\code2.0_20191011\Rvmdk\Gofun_UCOS-4G.uvproj

打开项目后报 absacc.h 未找到:
keil4 的 absacc.h 在 keil5 中已经移除了, 所以需复制 absacc.h 文件到 keil5 安装目录下: C:\Keil_v5\ARM\ARMCC\include\absacc.h

code2.0_20191011 文件夹包含 2.0 项目源文件，不带boot程序
code4.0_20190912 文件夹包含 4.0 项目源文件，带boot程序

》》4.0烧写工具\load 文件夹包含程序烧写工具：
  -- 4.0烧写工具\load\flash_TBOX4_BOOT.bat 是批处理脚本, 会用 JLink.exe 读取 jlink_TBOX4_BOOT.txt 文件执行程序写入过程
  -- 需把keil编译出来的boot固件(*.bin)和程序固件(*.bin)放到 4.0烧写工具\load 路径下, 并更新 jlink_TBOX4_BOOT.txt 中对应的固件地址

》》4.0烧写工具\添加CRC 文件夹包含CRC生成工具：
  -- 4.0烧写工具\添加CRC\flash-app-4g.bat 是批处理文件，会调用 CRC_len.exe 读取keil生成的固件路径，并生成一个新文件, 这个新文件包含 crc

》》2.0烧写工具\load 文件夹包含2.0车机烧写程序和车机2.0BOOT程序(该程序是厂家给的):
  -- 2.0烧写工具\load\BOOT2_0.bin 带CRC
  -- 2.0烧写工具\load\BOOTTEST.bin_BAK 不带CRC
  -- 2.0烧写工具\load\猛击这里.bat 是批处理文件，会将 2.0烧写工具\load\BOOT2_0.bin 写入设备
  -- 2.0烧写工具\load\2.0_120027_test50(1).bin 是keil生成的程序固件

》》如果BOOT不带crc, 则程序带不带crc均可
》》如果BOOT带crc, 则程序必须带crc
》》带crc的BOOT在keil中不可以调试



>> 改设备号:
   -- 用 UltraEdit 打开 BOOT.bin 固件, 00000400h 位置修改设备id
   -- 设备id修改完成后双击 2.0烧写工具\load\猛击这里.bat
   
>> 2.0车机改服务器host:
   -- 以下文件的833行
   -- D:\code2.0_20191011\src\GOFUN_SRC\GOFUN_4GFUN\Src\Gofun_4Ggsm_fun.c
   -- if ( GsmSendAt(DEF_GSM_UART,"AT+CIPOPEN=0,\"TCP\",\"terminal.shouqiev.net\",8788,0\r\n","+CIPOPEN:SUCCESS",500,CLEAR) )

>> 2.0车机改固件版本号:
   -- 以下文件的16行: 2048abcdV120023(V后边的就是固件版本号)
   -- D:\code2.0_20191011\src\GOFUN_SRC\GOFUN_BSP\Src\Gofun_sys_bsp_init.c

>> 4.0车机改服务器host:
   -- 以下文件的1062行
   -- D:\code4.0_20190912\src\GOFUN_SRC\GOFUN_4GFUN\Src\Gofun_4Ggsm_fun.c
   -- if ( GsmSendAt("AT+CIPOPEN=0,\"TCP\",\"terminal50.51gofunev.com\",8650,0\r\n","+CIPOPEN: 0,0\r\n",500,CLEAR) )

>> 2.0车机改固件版本号:
   -- 以下文件的24行: 2048abcdV120023(V后边的就是固件版本号)
   -- D:\code4.0_20190912\src\GOFUN_SRC\GOFUN_BSP\Src\Gofun_sys_bsp_init.c








