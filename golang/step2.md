# Hello, world!

## ポイント

* 拡張子は`.go`にしないと動かない
* `package main`はいったん「絶対書くもの」と思っておけばいい
* `import`は使いたいパッケージを読み込む記述
    * 基本的になにかしら読み込むはず
* とくに注意すること
    * コード内で使用していないパッケージは`import`してはいけない（実行エラーになる）
    * 使用しない変数は定義してはいけない（実行エラーになる）
    * とくにデバッグ時に引っかかることが多いので注意

なお、VSCodeでgoのアドオンを入れておくと、ファイル保存時にコードを自動解析して`import`文を自動で生成してくれたりインデントを揃えたりしてくれるようにできる。  
KatacodaのVSCodeにはアドオンを入れられないが、ローカルで試す場合は入れた方が良い。

## コード

`hello.go`ファイルを作成する。

```bash
touch hello.go
```{{execute}}

`hello.go`に以下をコピペする。  
※クリックでコピーできます。

```go
package main
import "fmt"
func main() {
    fmt.Println("hello world")
}
```{{copy}}

## 実行

```bash
go run hello.go
```{{execute}}
