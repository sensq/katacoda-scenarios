# 課題6-2-回答: モジュールに存在しない処理の冪等性を考える

`roles/kadai-6-2/tasks/shell.yaml`

```yaml
- name: checkfileにtestが書かれていることの確認（書かれていたら1が出力される）
  shell: grep test ~/checkfile | wc -l
  changed_when: false
  register: test_in_checkfile

- name: 確認結果を出力
  debug:
    msg: "{{ test_in_checkfile.stdout }}"

- name: 冪等性を保つための確認
  stat:
    path: ~/resultfile
  register: stat_resultfile

- name: checkfileにtestと書かれていた場合の処理
  shell: echo "test in checkfile" > ~/resultfile
  when:
    - test_in_checkfile.stdout == "1"
    - not stat_resultfile.stat.exists  # 冪等性を保つための条件
```{{copy}}

ポイント

* `grep`のタスクはサーバに変更を与えない確認処理のため、`changed_when: false`を使って強制的に`changed`が発生しないようにする
* 今回の`shell`で実行したい処理は特定のファイル作成を行う処理のため、ファイルの有無をタスクの実行条件にしている
  * 様々な状況を考慮するとこれだけでは不十分だが、今回はシンプルな実装で済ませている
  * 例えば、`resultfile`の中身が別の文字列になっていた場合もskippingになってしまうなどの問題が考えられる

## 補足

ほとんどのAnsibleでの操作はshellモジュールのみで実装可能である。  
しかし、今回の課題でわかるように、shellモジュールでの実装はユーザ側で冪等性を保つ方法を考える必要性が出てくる。  
一方で、それぞれの専用モジュールは内部的に冪等性を保つための実装が行われているため、ユーザが冪等性を保つことを意識しなくても冪等性を保って実行してくれる。  
このような理由から、shellモジュールはどうしてもやむを得ない場合にのみ使うものだと考えておくとよい。
