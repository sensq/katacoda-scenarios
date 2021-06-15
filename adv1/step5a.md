# 課題3-回答: テンプレートを利用してファイルを配布する

`roles/kadai-3/tasks/template.yaml`{{open}}

```yaml
- name: template file
  template:
    src: ./templates/template_file.j2
    dest: /tmp/template_file
```{{copy}}


`roles/kadai-3/tasks/main.yaml`{{open}}

```yaml
- include: template.yaml
```{{copy}}
