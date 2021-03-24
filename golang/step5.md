# FizzBuzz問題

今までの基本構文を組み合わせた例として、FizzBuzz問題のプログラムを作成します。  
FizzBuzz問題とは、以下のルール（アルゴリズム）で入出力を行う問題です。

* 1から100までを出力する
* ただし、3で割り切れる場合は`Fizz`と出力する
* ただし、5で割り切れる場合は`Buzz`と出力する
* ただし、3でも5でも割り切れる場合は`FizzBuzz`と出力する

以下の要素が必要になるため、基本的なプログラミングを学ぶ際の課題としてよく題材に挙げられます。

* ループ
* 剰余計算
* 条件分岐
* 基本的な出力

## コード

以下のコードを`fizzbuzz.go`というファイル名で作成してください。

```go
package main
import "fmt"

func main() {
	// 自分で考えて作成
}
```{{copy}}

実行

```bash
go run fizzbuzz.go
```{{execute}}

実行例

```text
$ go run fizzbuzz.go
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
```
