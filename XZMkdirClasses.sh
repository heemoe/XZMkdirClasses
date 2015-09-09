#!/bin/bash
echo "请输入文件夹名,以空格分隔"
read -a arr
echo "你总共要创建${#arr[@]}个:"${arr[@]}
for ((i = 0 ; i < ${#arr[@]} ; i ++)) do
echo "开始建立"${arr[$i]}"文件夹"
if [ -z "${arr[$i]}" ]
then
echo "跳过一个空"
else
mkdir -p Classes/${arr[$i]}/Model
mkdir -p Classes/${arr[$i]}/View
mkdir -p Classes/${arr[$i]}/Controller
fi
echo "---->>>"${arr[$i]}"文件夹已建立"
done
mkdir -p Classes/Other/Category
mkdir -p Classes/Other/Main
echo "输入你的项目放代码的文件夹"
read path
if [ -f "$path" ]
then
OLD_IFS="$IFS"
IFS="/"
arr=($path)
IFS="$OLD_IFS"
last=${#arr[@]}
unset arr[$last-1]
SAVE_IFS="$IFS"
IFS="/"
FOOJOIN="${arr[*]}"
IFS="$SAVE_IFS"
mv Classes $FOOJOIN
open $FOOJOIN
else 
mv Classes $path
open $path
fi
echo "Done! enjoy!"
echo "		by xizi."
echo "		blog: http://www.ixizi.cn"