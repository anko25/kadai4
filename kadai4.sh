#!/bin/sh

#最大公約数をユークリッドの互除法で求めるプログラム

#前提チェック処理
 #引数の数が2つであること
if [ $# -ne 2 ]; then
	echo "input 2 argments" 1>&2
	exit 1
fi
 #引数が正の数であること 主に負の数をチェック
echo "$1$2" | grep [^0-9] > /dev/null 2>&1
if [ $? -eq 0  ]; then
	echo "input natural number" 1>&2
	exit 1
fi
 #引数が整数であること 
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2  ]; then
        echo "input natural number" 1>&2
        exit 1
fi
 #0チェック
if [ $1 -eq 0 -o $2 -eq 0 ]; then
        echo "input natural number" 1>&2
        exit 1
fi

#最大公約数を求める処理
dived_num="$1"
div_num="$2"
mod_num="$((dived_num % div_num))"
dived_num="$div_num"
div_num="$mod_num"

while [ $mod_num -ne 0 ]
do
	mod_num="$((dived_num % div_num))"
	dived_num="$div_num"
	div_num="$mod_num" 
done 
echo ${dived_num}
exit 0
