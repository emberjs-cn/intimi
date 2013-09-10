## 开发说明

VERSION: 0.2.0

### 开发流程定义

1. 在`https://github.com/emberjs-cn/intimi`上fork项目。
1. 从fork的项目签出项目源代码。（项目的主开发分支为develop）
1. 运行测试。版本库中的代码是能通过单元测试的，这也能确保你签出的代码状态没有问题。
1. 创建分支进行开发。

  ```bash
  # 使用gitflow
  git flow feature start branch-name

  # 不使用gitflow
  git branch branch-name
  ```

4. 首先编写测试。如果只是对文档进行修改，可以忽略此步骤。如果是编写一个新功能或者修订一个错误，则必须添加测试，用于保证正确性。
5. 编写实现代码，满足第四部定义的测试。
6. 将分支`push`到`github.com`上fork的项目，并提交一个合并请求（pull
   request）。

  ```bash
  # 使用gitflow
  git flow feature publish branch-name

  # 不使用gitflow
  git push origin branch-name
  ```

7. 待合并请求被处理后，切换到`develop`分支，删除本地分支。

  ```bash
  git checkout develop

  # 使用gitflow
  git branch -d features/branch-name

  # 不使用gitflow
  git branch -d branch-name
  ```

提交的合并请求会在一个工作日内完成审阅，审阅后通常会给出一定的修改意见，你可以通过线上或者线下的方式与审阅人讨论修改方案，发表你的开发。直至该合并请求不再有修改，审阅人会将合并你的申请，并同时删除你提交到代码服务器的开发分支。

### 编码规范

* [Ruby编码规范](https://github.com/bbatsov/ruby-style-guide)
* [Rails编码规范](https://github.com/bbatsov/rails-style-guide)
* [Javascript编码规范](https://github.com/airbnb/javascript)
* [Coffeescript编码规范](https://github.com/polarmobile/coffeescript-style-guide)
