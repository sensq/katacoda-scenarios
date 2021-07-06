Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [**7**](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - [11](step11.md) - [12](step12.md) - End


# ループについて

自動化をしたい操作の対象には、同じような処理を何度も行うような操作も多くあります。  
シンプルな例としては、複数のユーザを作成したい、複数のファイルを取得したいなどが考えられます。  
これを素直に記載すると以下のようなコードになります。

```yaml
# satoユーザを作成
- name: "Add sato user"
  user:
    name: sato

# suzukiユーザを作成
- name: "Add suzuki user"
  user:
    name: suzuki

# takahashiユーザを作成
- name: "Add takahashi user"
  user:
    name: takahashi
```

このような場合は以下のようにループを使用すると、冗長な記述を無くしてシンプルなコードにできます。  
冗長な記述を減らすことはバグの削減や可読性の向上などにも繋がり、良いコードを書くために重要なテクニックとなります。

```yaml
# sato, suzuki, takahashiユーザを作成
- name: "Add users"
  user:
    name: "{{ item }}"
  loop:
    - sato
    - suzuki
    - takahashi
```

## ループと変数の併用について

ループは変数と組み合わせて使用する場合も多く、これを利用することでループ回数が実行対象ごとに異なるループを作成できます。  
上記のタスクでは実行したすべてのサーバに`sato, suzuki, takahashi`の3ユーザが作成されますが、
変数化しておくと「サーバごとに異なる個数の任意の名前のユーザ」を作成することができ、より汎用的なPlaybookになります。  
ただし、ループをむやみに多用すると目的の不明瞭なコードになってしまう場合もあるため、適切に使い分けることが大事です。

---

- [前のページに戻る](step6a.md)
- [目次](README.md)
- [次のページに進む](step8.md)
