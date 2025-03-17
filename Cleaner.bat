@echo off
title Goblin Services - Cleaner - Stage 1 / 10 - Taskkill fn and delete some basics


cls

for %%p in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
   call :rand1
   call :rand
   if exist %%p:\nul start "" /b /wait volumeid64.exe %%p: !rnd!-!rnd1! /accepteula
)
call :rand1
call :rand
start "" /b /wait volumeid64.exe C: !rnd!-!rnd1! /accepteula

start /wait /b  DeviceCleanupCmd.exe * -s
DriveCleanup.exe
 
cls


for %%p in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%p:\nul DevManView.exe /uninstall "%%p:\" && echo did %%p drive
cls
@echo on
DevManView.exe /uninstall "C:\"
DevManView.exe /uninstall "Realtek*" /use_wildcard
DevManView.exe /uninstall "Disk drive*" /use_wildcard
DevManView.exe /uninstall "Disk"
DevManView.exe /uninstall "disk"
DevManView.exe /uninstall "Disk&*" /use_wildcard
DevManView.exe /uninstall "SWD\WPDBUSENUM*" /use_wildcard
DevManView.exe /uninstall "USBSTOR*" /use_wildcard
DevManView.exe /uninstall "SCSI\Disk*" /use_wildcard
DevManView.exe /uninstall "STORAGE*" /use_wildcard
DevManView.exe /uninstall "Motherboard*" /use_wildcard
DevManView.exe /uninstall "Volume*" /use_wildcard
DevManView.exe /uninstall "PCI-to-PCI*" /use_wildcard
DevManView.exe /uninstall "System*" /use_wildcard
DevManView.exe /uninstall "ACPI\*" /use_wildcard
DevManView.exe /uninstall "Remote*" /use_wildcard
DevManView.exe /uninstall "Standard*" /use_wildcard
@echo off
devcon rescan

cls

@echo on
DevManView.exe /uninstall "WAN Miniport*" /use_wildcard
DevManView.exe /uninstall "Microsoft*" /use_wildcard
DevManView.exe /uninstall "PCI\VEN*" /use_wildcard
DevManView.exe /uninstall "SWD\MS*" /use_wildcard
@echo off


exit

:rand
set /a rnd=(!RANDOM!%%(max-min+1^)^)+min
goto :eof

:rand1
set /a rnd1=(!RANDOM!%%(max-min+1^)^)+min
goto :eof