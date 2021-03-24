# FizzBuzz問題 -回答編-

## ポイント

* 「3でも5でも割り切れる」⇒「15で割り切れる」と読み替えて考える
* if文の条件の順番
    * 上から順に評価されるため、「15で割り切れる」は最初に書く必要がある

## 回答例

```go
package main
import "fmt"

func main() {
	for i := 1; i <= 100; i++ {
		if (i % 15 == 0){
			fmt.Println("FizzBuzz")
		}else if (i % 5 == 0) {
			fmt.Println("Buzz")
		}else if (i % 3 == 0) {
			fmt.Println("Fizz")
		}else{
			fmt.Println(i)
		}
	}
}
```{{copy}}
