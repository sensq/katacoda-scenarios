# 課題6-1-回答: モジュールに存在しない処理を実行する

`roles/kadai-6/tasks/shell.yaml`

```yaml
- name: checkfileにtestが書かれていることの確認（書かれていたら1が出力される）
  shell: grep test ~/checkfile | wc -l
  register: test_in_checkfile

- name: 確認結果を出力
  debug:
    msg: "{{ test_in_checkfile.stdout }}"

- name: checkfileにtestと書かれていた場合の処理
  shell: echo "test in checkfile" > ~/resultfile
  when:
    - test_in_checkfile.stdout == "1"
```{{copy}}


`roles/kadai-6/tasks/main.yaml`

```yaml
- include: shell.yaml
```{{copy}}
