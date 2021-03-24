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

## 配列

配列は定義した時点で要素数を指定する（あるいは初期化する）必要があります。  
可変長の配列として扱いたい場合は後述するスライスを利用します。  
以下のコードを`array.go`というファイル名で作成してください。

```go
package main
import "fmt"
func main() {
	var N int
	fmt.Print("作成する配列の要素数を指定してください: ")
	fmt.Scan(&N)

	// 空の配列を先に作るパターン
	a := make([]int, N)
	for i := 0; i < N; i++ {
		a[i] = i
	}
	fmt.Println(a)

	// 定義と同時に初期化するパターン
	b := [3]int{1, 2, 3}
	for i := 0; i < 3; i++ {
		b[i] = i
	}
	fmt.Println(b)
}
```{{copy}}

実行

```bash
go run array.go
```{{execute}}

実行例

```text
$ go run array.go
作成する配列の要素数を指定してください: 7
[0 1 2 3 4 5 6]
[0 1 2]
```

## スライス

Goには配列とスライスと呼ばれるリスト形式があり、どちらも一般的なプログラミング言語の配列として扱うことができます。  
配列は固定長である必要がある一方でスライスは可変長で、配列よりもスライスの方が柔軟に使用することができるため、Goで配列を使いたい場面ではスライスを使用することが多いです。  
ただし、サイズが明確な場合や特定の位置に特定の値を入れたい場合など、配列を使う方がシンプルで可読性の高いコードになる場合もあるため、用途に応じて使い分けると良いです。  
また、明示的に両者を使い分けたい場合を除いて、敢えて「スライス」と記載することは少なく、どっちでもいいという意図で「配列」と記載していることが多いです。

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
	// 要素を追加
	a = append(a, 10)
	fmt.Println("要素を追加")
	fmt.Println(a)
	// 2番目から4番目までの要素のみを取り出す
	a = a[1:4]
	fmt.Println("2番目から4番目までの要素のみを取り出す")
	fmt.Println(a)
	// 先頭の要素を削除（＝2番目以降の要素をすべて取り出す）
	a = a[1:]
	fmt.Println("先頭の要素を削除")
	fmt.Println(a)
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
要素を追加
[3 5 8 2 4 10]
2番目から4番目までの要素のみを取り出す
[5 8 2]
先頭の要素を削除
[8 2]
```

## 連想配列（マップ）

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
