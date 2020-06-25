#!/bin/sh

tmp=/tmp/$$
echo "input 2 argments" > $tmp-args
echo "input natural number" > $tmp-nat

ERROR_EXIT () {
	echo "$1" >&2
	rm -f $tmp-*
	exit 1
}

#テスト開始
#test1-1: 引数の数が足りない 0個
./kadai4.sh 2> $tmp-ans && ERROR_EXIT "error in test1-1"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test1-1-1"

#test1-2: 引数の数が足りない 1個
./kadai4.sh 100 2> $tmp-ans && ERROR_EXIT "error in test1-2"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test1-2-1"

#test1-3: 引数の数が足りない 3個
./kadai4.sh 100 200 300 2> $tmp-ans && ERROR_EXIT "error in test1-3"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test1-3-1"

#test2-1: 引数が整数ではない 1つ目
./kadai4.sh a 100 2> $tmp-ans && ERROR_EXIT "error in test2-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-1-1"

#test2-2: 引数が整数ではない 2つ目
./kadai4.sh 100 a 2> $tmp-ans && ERROR_EXIT "error in test2-2"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-2-1"

#test2-3: 引数が整数ではない 両方
./kadai4.sh a b 2> $tmp-ans && ERROR_EXIT "error in test2-3"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-3-1"

#test2-4: 引数が整数ではない マイナス数値 1つ目
./kadai4.sh -100 200 2> $tmp-ans && ERROR_EXIT "error in test2-4"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-4-1"

#test2-5: 引数が整数ではない マイナス数値 2つ目
./kadai4.sh 100 -200 2> $tmp-ans && ERROR_EXIT "error in test2-5"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-5-1"

#test2-6: 引数が整数ではない マイナス数値 両方
./kadai4.sh -100 -200 2> $tmp-ans && ERROR_EXIT "error in test2-6"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-6-1"

#test2-7: 引数が整数ではない 0 1つ目
./kadai4.sh 0 200 2> $tmp-ans && ERROR_EXIT "error in test2-7"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-7-1"

#test2-8: 引数が整数ではない 0 2つ目
./kadai4.sh 100 0 2> $tmp-ans && ERROR_EXIT "error in test2-8"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-8-1"

#test2-9: 引数が整数ではない 0 両方
./kadai4.sh 0 0 2> $tmp-ans && ERROR_EXIT "error in test2-9"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-9-1"

#test2-10: 引数が整数ではない 小数 1つ目
./kadai4.sh 10.5 200 2> $tmp-ans && ERROR_EXIT "error in test2-10"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-10-1"

#test2-11: 引数が整数ではない 小数 2つ目
./kadai4.sh 100 10.6 2> $tmp-ans && ERROR_EXIT "error in test2-11"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-11-1"

#test2-12: 引数が整数ではない 小数 両方
./kadai4.sh 21.2 31.5 2> $tmp-ans && ERROR_EXIT "error in test2-12"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test2-12-1"
