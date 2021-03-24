# 基本的な構文1

## 入出力

2つの整数値を入力し、2つを加算した値を出力するコードを作成します。  
以下のコードを`add.go`というファイル名で作成してください。

```go
package main
import "fmt"
func main() {
	var a, b int
	fmt.Print("1つ目の整数を入力してください: ")
	fmt.Scan(&a)
	fmt.Print("2つ目の整数を入力してください: ")
	fmt.Scan(&b)
	fmt.Print("2つの値を足した値: ")
	fmt.Println(a + b)
}
```{{copy}}

実行

```bash
go run add.go
```{{execute}}

実行例

```text
$ go run add.go
1つ目の整数を入力してください: 3
2つ目の整数を入力してください: 5
2つの値を足した値: 8
```

## 条件分岐

整数値を1つ入力し、入力された値が偶数か奇数かを判定するコードを作成します。  
以下のコードを`check_even_odd.go`というファイル名で作成してください。

```go
package main
import "fmt"
func main() {
	var a int
	fmt.Print("整数を入力してください: ")
	fmt.Scan(&a)
	if (a % 2 == 0){
		fmt.Println("偶数")
	}else{
		fmt.Println("奇数")
	}
}
```{{copy}}

実行

```bash
go run check_even_odd.go
```{{execute}}

実行例

```text
$ go run check_even_odd.go
整数を入力してください: 5
奇数
$ go run check_even_odd.go
整数を入力してください: 4
偶数
```

## ループ

1つの整数値を入力し、1から入力した値までの数値を合計した値を出力するコードを作成します。  
以下のコードを`calc_total.go`というファイル名で作成してください。

```go
package main
import (
	"fmt"
	"strconv"
)

func main() {
	var a int
	fmt.Print("整数を入力してください: ")
	fmt.Scan(&a)

	total := 0
	for i := 0; i <= a; i++ {
		total += i
	}
	// 整数を文字列に変換
	str_a := strconv.Itoa(a)
	fmt.Println(fmt.Sprintf("1から%sまでを合計した値: ", str_a))
	fmt.Println(total)
}
```{{copy}}

実行

```bash
go run calc_total.go
```{{execute}}

実行例

```text
$ go run calc_total.go
整数を入力してください: 3
1から3までを合計した値: 
6
$ go run calc_total.go
整数を入力してください: 10
1から10までを合計した値: 
55
$ go run calc_total.go
整数を入力してください: -3
1から-3までを合計した値: 
0
```
