

## 未定义pid_t

如果编译器报告 pid_t 未定义，可能是因为编译器没有包含必要的头文件，或者你的编译器不支持 POSIX 标准。
pid_t 是 POSIX 标准中定义的用于表示进程ID的类型。要使用 pid_t，需要包含 <sys/types.h> 头文件。

## pipe
参考(链接)[https://blog.csdn.net/JMW1407/article/details/107700451]

## cdel
https://cdecl.org/
## 有关c语音的标准和拓展见这个

https://www.zhaixue.cc/c-arm/c-arm-intro.html
c语言的标准有:K&R c(传统c、c程序设计语言)、ANSI c(标准c、C89、c90、ISO C)、C99 、C11 、C17 ...
# ANSI C

## 标准输入输出 stdio.h
### 常量
- #define EOF (-1)
- #deine NULL 0
- #define	STDIN_FILENO	0
- #define	STDOUT_FILENO	1
- #define	STDERR_FILENO	2
### 输入输出
- int getchar(void)
- int putchar(int)
- int printf(char *fmt,...)
- int scanf(char *fmt,...)
### 文件流
- FILE 
typedef struct {
    int fd;
    int cnt;
    char *base;
    char *ptr;
    int flags;
} FILE;
    - #define BUFSIZ 512
- enum _flags 
{
       _READ   = 01,   /* file open for reading */
       _WRITE  = 02,   /* file open for writing */
       _UNBUF  = 04,   /* file is unbuffered */
       _EOF    = 010,  /* EOF has occurred on this file */
       _ERR    = 020   /* error occurred on this file */
}
- FILE * fopen(char *name,char *mode)
- int fgetc(FILE * fp)
- #define getchar() fgetc(stdin)
- int fputc(char c,FILE * fp)
- #define putchar(c) fgetc(c,stdout)
- int fprintf(FILE *fp,char *fmt,...)
- int fscantf(FILE *fp,char *fmt,...)
    - 实际上printf也可以定义为fprintf
- int ferror(FILE *fp)
    - 未发生错误返回0，发生错误时返回非零值
- int feof(FILE *fp)
    - 未到达末尾返回0，到达末尾返回非零值
- int fputs(char *c,FILE *fp)
- int fgets(char *c,int n,FILE *fp)
    - int gets(char *c,int n)
    - int puts(char *c)
    - gets读取时会删除字符串末尾的'\n',puts输入时会自动添加'\n'
- int fclose(FILE * fp)
- int ungetc(char c,FILE *fp)
- int remove(char * name)
- long fseek(FILE* fd,int long,int begin)
> **[info] 文件流与文件描述符**
> 
> 文件描述符是底层实现，流是文件描述符的封装，添加了缓冲(注意标准错误输出无缓冲，是直接采用文件描述符)


> **[info] STDIN_FILENO与stdin**
>
在<stdio.h>中两者的定义如下
```
#define STDIN_FILENO 0
#define stdin (__acrt_iob_func(0))
```
- STDIN_FILENO 是一个整数常量，它表示标准输入文件描述符(File Descriptor)
- stdin 它是一个指向标准输入流的文件指针FILE


## 字符串库 string.h
- int strcat(char *s,char *t)
- int strncat(char *s,char *t,int n)
- int strcmp(char *s ,char *t)
- int strncmp(char *s,char * t, int n)
- int strlen(char *s)
- char * strchr(char *s,char *t)
- char * strnchr(char * s,char *t ,int n)

## 类型库 sys/ctypes.h
- int isupper(char c)
- int isdigit(char c)
- int isalpha(char c)
- int islower(char c)
- int isalnum(char c)
- int isspace(char c)

- char toupper(char c)
- char tolower(char c)
## 标准库文件 stdlib.h
- int system(char *s)
- void *malloc(size_t n)
- void *calloc(size_t n,size_t size)
    -malloc返回的空间未被初始化，calloc被初始化为0
- void free(void * p)

- int rand(void)
    - 生成介于0和RNAD_MAX之间的数，RAND_MAX是stdlib中的常量
    - #define frand() ((double) rand() / (RAND_MAX+1.0))
- int srand(unsigned int seed)
## 数学函数 math.h
## 目录头文件diren t.h
#define NAME_MAX   14
typedef struct {
    long ion;
    char name[NAME_MAX +1]
}Dirent;
typedef struct {
    int fd;
    Dirent d;
}DIR;
DIR opendir(char *name);
Dirent readdir(DIR *dfd)
void closedir(DIR *dfd)



## unix系统接口 unistd.h

### 文件 I/O 函数：
- int open(char *name ,int flags,int perms)
- int creat(char *name,int perms)
    - flags为包含在<fcntl.h>(System V 系统)或者<sys/file.h>(BSD 系统)的常量
    - O_RDONLY 只读
    - O_WRONLY 只写
    - O_RDWR 读写
    - perms为文件权限，比如0755,打开的时候默认为0
    -发生错误返回-1
- int read(int fd,void *buff,int n)
- int write(int fd,void *buff,int n)
    - 返回读写的字节数,可能会小于n,读写设备满或者空时返回0，发生错误时返回-1
- int errno(char *fmt,...)
- int unlink(char * name)
- long lseek(int fd,int long,int begin)
    - begin可以是0,1,2，分别表示开始、当前、结束
进程控制函数：

fork()：创建一个新进程。
exec()：执行一个新程序。
exit()：终止当前进程。
getpid()：获取当前进程的进程 ID。
getppid()：获取当前进程的父进程 ID。
wait()：等待子进程退出。
sleep()：使进程睡眠指定的时间。
alarm()：设置定时器。
kill()：向指定进程发送信号。
系统信息函数：

getuid()：获取实际用户 ID。
getgid()：获取实际组 ID。
geteuid()：获取有效用户 ID。
getegid()：获取有效组 ID。
gethostname()：获取主机名。
uname()：获取系统信息。
其他功能函数：

chdir()：改变当前工作目录。
getcwd()：获取当前工作目录。
access()：检查文件的访问权限。
getopt()：解析命令行选项。


除了已经提到的函数之外，<unistd.h> 头文件中还包含了一些其他的函数声明。以下是其中一些常见的函数：

内存操作函数：

brk()：设置程序数据段的结束地址。
sbrk()：调整程序数据段的大小。
getpagesize()：获取系统页面大小。
mmap()：创建一个新的映射区域或修改现有映射区域。
环境函数：

getenv()：获取环境变量的值。
setenv()：设置环境变量的值。
unsetenv()：删除指定的环境变量。
时间函数：

sleep()：使进程休眠指定的秒数。
usleep()：使进程休眠指定的微秒数。
alarm()：设置定时器，并在指定时间后发送 SIGALRM 信号。
系统调用：

syscall()：进行系统调用。
其他：

getpagesize()：获取系统页面大小。
gethostname()：获取主机名。
isatty()：检查文件描述符是否与终端相关联。
## fcntl.h

<fcntl.h> 头文件提供了对文件控制的一些函数和宏定义。以下是一些常见的函数和变量：

函数：
321m333 m m
宏定义：
文件访问模式（File Access Modes）：

O_RDONLY：只读模式。
O_WRONLY：只写模式。
O_RDWR：读写模式。
文件创建标志（File Creation Flags）：

O_CREAT：如果文件不存在则创建。
O_EXCL：与 O_CREAT 一起使用，确保创建新文件。
O_TRUNC：如果文件存在并且为写入而打开，则将其截断为零长度。
文件状态标志（File Status Flags）：

O_APPEND：在每次写入时追加到文件末尾。
O_NONBLOCK：非阻塞模式。
O_SYNC：同步写入。
O_DSYNC：同步写入数据。
文件控制操作命令（File Control Operations）：

F_GETFL：获取文件状态标志。
F_SETFL：设置文件状态标志。
F_GETLK：获取文件锁。
F_SETLK：设置文件锁。
F_SETLKW：设置文件锁，并在需要时等待。
文件锁类型（File Lock Types）：

F_RDLCK：读取锁。
F_WRLCK：写入锁。
F_UNLCK：解锁。

## sched.h
## sys/time.h

## sys/types.h



## 语句表达式
https://www.zhaixue.cc/c-arm/c-arm-express.html




## C标准库

### <string.h>

- void memset(void *s,int c,size_t n) 
sizt_t strlen(const void *s)

##<stdarg.h>
va_list ap
va_start(ap,fmt)
va_arg(ap,double/int...)


 #include <stdarg.h>
   /* minprintf: minimal printf with variable argument list */
   void minprintf(char *fmt, ...)
   {
       va_list ap; /* points to each unnamed arg in turn */
       char *p, *sval;
       int ival;
       double dval;
       va_start(ap, fmt); /* make ap point to 1st unnamed arg */
       for (p = fmt; *p; p++) {
           if (*p != '%') {
               putchar(*p);
               continue;
           }
           switch (*++p) {
           case 'd':
               ival = va_arg(ap, int);
               printf("%d", ival);
               break;
           case 'f':
               dval = va_arg(ap, double);
               printf("%f", dval);
               break;
           case 's':
               for (sval = va_arg(ap, char *); *sval; sval++)
                   putchar(*sval);
               break;
           default:
               putchar(*p);
               break;
           }
       }
       va_end(ap); /* clean up when done */
   }