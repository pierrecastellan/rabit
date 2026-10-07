#! /bin/bash
cd /home/pierre/rabit
JLinkExe  -device STM32F103C8 -if SWD -speed 4000 -autoconnect 1 -CommandFile ./flash.Jlink


