Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [**9**](step9.md) - [10](step10.md) - [11](step11.md) - [12](step12.md) - End


# 条件分岐について

多少複雑なPlaybookや汎用的なPlaybookを作ると、変数やサーバの状態に応じて処理を分岐させたくなる場合が出てきます。  
わかりやすい実用的な例としてはパッケージのインストールが挙げられます。  
パッケージのインストールはOSのディストリビューションによって`yum`や`apt`を使い分ける必要があるため、
Ansibleで実行させるタスクもディストリビューションによって使い分ける必要があります。  
このような使い分けを1つのPlaybookで実装したい場合は`when`を使って条件分岐させます。

Ansibleでは実行時に`ansible_os_family`というマジック変数が自動的に定義され、この値を参照するとOSのディストリビューションを識別することができます。  
`RedHat`系のOSは`yum`、`Debian`系のOSは`apt`を使ってパッケージのインストールを行うため、
これを利用して以下のようにコードを記述すると、どちらのOSに実行しても適切な方法でパッケージのインストールを行うPlaybookが作成できます。

```yaml
- name: "install Apache using yum"
  yum:
    name: httpd
    stat: present
  when: ansible_os_family == "RedHat"

- name: "Install Apache using apt"
  apt:
    name: apache2
    stat: present
  when: ansible_os_family == "Debian"
```

---

- [前のページに戻る](step8a.md)
- [目次](README.md)
- [次のページに進む](step10.md)
