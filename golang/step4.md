# 基本的な構文2

## 変数

変数の定義方法を理解します。  
以下のコードを`variable.go`というファイル名で作成してください。

```go
package main
import "fmt"
func main() {
	var a1 int
	a1 = 3
	fmt.Println(a1)

	var s1 string
	s1 = "test"
	fmt.Println(s1)

	// 定義と同時に初期化する記法
	a2 := 5
	fmt.Println(a2)
	s2 := "hoge"
	fmt.Println(s2)
}
```{{copy}}

実行

```bash
go run variable.go
```{{execute}}

実行例

```text
$ go run variable.go
3
test
5
hoge
```

## スライス

Goには配列とスライスと呼ばれるリスト形式があり、どちらも一般的なプログラミング言語の配列として扱うことができます。  
ただし、配列は固定長である必要がある一方でスライスは可変長で、配列よりもスライスの方が柔軟に使用することができるため、Goで配列を使いたい場面ではスライスを使用することが多いです。  
現時点ではスライスだけを覚えておけば問題ありません。  
また、明示的に両者を使い分けたい場合を除き、敢えて「スライス」と記載せずに「配列」と記載することも多いため、基本的に配列と書いてあってもスライスと思って問題ないです。、

以下のコードを`slice.go`というファイル名で作成してください。

```go
package main
import "fmt"
func main() {
	a := []int{3, 5, 8, 2, 4}
	fmt.Println(a)
	for i, v := range a {
		fmt.Println(i, v)
	}
}
```{{copy}}

実行

```bash
go run slice.go
```{{execute}}

実行例  
`for`文で定義した1つ目の変数（`i`）でインデックス番号、2つ目の変数（`v`）で値を参照できます。

```text
$ go run slice.go
[3 5 8 2 4]
0 3
1 5
2 8
3 2
4 4
```

## 連想配列（マップ）

1つの整数値を入力し、1から入力した値までの数値を合計した値を出力するコードを作成します。  
連想配列と呼ばれる、Key-Value形式でデータを定義できる特殊な配列の使い方を理解します。  
連想配列にはインデックス番号ではなく、Keyを指定してアクセスします。  
以下のコードを`map.go`というファイル名で作成してください。

```go
package main
import "fmt"

func main() {
	m := map[string]int{"国語": 85, "数学": 78, "英語": 80}
	fmt.Println(m)
	for i, v := range m {
		fmt.Println(i, v)
	}
	fmt.Println("英語の得点は、")
	fmt.Println(m["英語"])
}
```{{copy}}

実行

```bash
go run map.go
```{{execute}}

実行例

```text
$ go run map.go
map[国語:85 数学:78 英語:80]
英語 80
国語 85
数学 78
英語の得点は、
80
```
