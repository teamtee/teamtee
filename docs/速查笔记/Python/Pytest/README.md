
## 继续
要让 pytest 在测试函数中遇到失败的断言后继续执行并检查剩余的断言，你可以使用 pytest 中的 `--continue-on-collection-errors` 或 `--no-failures` 参数。

这些参数告诉 pytest 继续执行测试，并在收集测试过程中遇到错误时忽略它们。

你可以这样运行 pytest：

```bash
pytest --continue-on-collection-errors
```

或者

```bash
pytest --no-failures
```

这将允许 pytest 在遇到断言失败后继续执行测试函数中的剩余断言。