课后作业链接：https://github.com/remzi-arpacidusseau/ostep-homework
中文书籍链接：本地
课后答案链接：https://github.com/xxyzz/ostep-hw

##
以下是一个示例程序，它创建一个子进程，然后在子进程中关闭标准输出
```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid;

    pid = fork();

    if (pid < 0) {
        fprintf(stderr, "Fork failed\n");
        return 1;
    } else if (pid == 0) { // 子进程
        // 关闭标准输出
        close(STDOUT_FILENO);
        printf("This won't be printed\n");
    } else { // 父进程
        printf("Parent process\n");
    }

    return 0;
}

```

## 
写一个程序，创建两个子级，并使用系统调用将一个子级的标准输出连接到另一个子级的标准输入pipe()