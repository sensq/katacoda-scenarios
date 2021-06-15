# 課題5-回答: 条件分岐を使う

`roles/kadai-5/tasks/when.yaml`{{open}}

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: server_location == "豊洲"
```{{copy}}


`roles/kadai-5/tasks/main.yaml`{{open}}

```yaml
- include: when.yaml
```{{copy}}
