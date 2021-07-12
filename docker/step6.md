# コンテナレジストリを利用する

ビルドしたコンテナイメージはローカルにしか存在していないため、
他の環境から利用するためには、利用したい環境がアクセス可能な場所にコンテナイメージを置いておかなければなりません。  
また、コンテナイメージの取得はPullという操作で行われるため、配置する環境はPullに対応している必要があります。  
このような用途として用意されている場所が「コンテナレジストリ」になります。

コンテナレジストリは独自に構築することも可能ですが、パブリックのサービスとして個人が自由に利用可能なものもあります。  
例としては、Docker HubやGitHub, GitLabが挙げられます。  
これらに置いたコンテナイメージは基本的にパブリック公開されますが、パスワードを設定するなどしてプライベート利用することも可能です。  
また、コンテナレジストリサービスを提供しているパブリッククラウドも多く、
AWSではECR（Amazon Elastic Container Registry）、AzureではACR（Azure Container Registry）があります。  
コンテナレジストリそのものの用途やメリットなどはどこを使っても大きくは変わらないため、運用管理や他の仕組みとの連携方法などを含めて検討することになります。

なお、個人がパブリックのコンテナレジストリを自由に利用可能ということは、
中で何が動いているのかわからないコンテナイメージが誰でも使える状態で大量に乱立しているということでもあります。  
過去には仮想通貨のマイニングを行うマルウェアの仕込まれたコンテナイメージが問題になったことなどもあるため、
非公式で安全性の確認が取れないコンテナイメージは利用しないことを推奨します。

## コンテナレジストリにイメージをPushする

TBD

## Pushしたコンテナイメージからコンテナを起動する

TBD