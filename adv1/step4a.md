# 課題2-回答: Ansibleでファイルを配布する

`roles/kadai-2/tasks/copy.yaml`{{open}}

```yaml
- name: copy file
  copy:
    src: ./files/copy_file
    dest: /tmp/copy_file
```{{copy}}


`roles/kadai-2/tasks/main.yaml`{{open}}

```yaml
- include: copy.yaml
```{{copy}}
