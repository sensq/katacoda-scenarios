# 環境を準備する

> ⚠️ 注意  
> この手順は本演習環境へ接続するたびに最初に実行する必要があります。  
> 画面更新や再アクセスした際は実行し忘れないようにしてください。

> ⚠️ 注意  
> コマンドを実行する際は、直前に実行したコマンドが完了したのを確認してから実行してください。  

1. 以下のコマンドを実行します  

```bash
while [ ! -e /tools/setup.sh ]
do
  sleep 1
done
bash /tools/setup.sh && source /etc/profile.d/init-env.sh
```{{execute}}

2. カレントディレクトリを`~/works`に変更します  
`cd ~/works`{{execute}}  
以降、本演習では特に指示がない限り、上記ディレクトリをカレントディレクトリとした状態で作業することを前提とします。  
異なったディレクトリで記載通りのコマンドを実行すると失敗することがあるため、カレントディレクトリを変更した際はご注意ください。

3. Ansibleが実行できることを確認します  
`ansible -m ping -i inventory all`{{execute}}

以下の環境が構築されます。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/test/img/arch.drawio.svg)

各ターゲットへSSHで接続する際は、以下のコマンドを実行してください。  
SSHから抜ける際は`exit`コマンドを実行すると元のコンソールへ戻ることができます。

1号機: `ssh target01 -i /root/.ssh/test_key`{{execute}}  
2号機: `ssh target02 -i /root/.ssh/test_key`{{execute}}  
3号機: `ssh target03 -i /root/.ssh/test_key`{{execute}}  
