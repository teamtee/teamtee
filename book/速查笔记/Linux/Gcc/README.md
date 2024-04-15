-o <file>：指定输出的可执行文件名。例如，-o my_program会生成名为my_program的可执行文件。

-c：只编译源代码，不进行链接。这将生成对象文件（.o文件）。

-Wall：开启所有标准的警告信息，帮助发现代码中的潜在问题。

-Wextra：开启额外的警告信息，提供比-Wall更多的警告。

-Wpedantic：严格遵循C/C++标准，对于任何非标准的行为给出警告。

-O0、-O1、-O2、-O3：设置优化级别。-O0表示没有优化（默认），-O1为级别1的优化，-O2为级别2的优化，-O3为级别3的优化。优化可以提高代码的运行效率。

-Os：开启尺寸优化，旨在生成更小的可执行文件。

-g：生成调试信息，这对于调试程序非常有用。

-std=c99、-std=c11：指定C语言的标准版本。类似地，-std=c++98、-std=c++03、-std=c++11、-std=c++14、-std=c++17等用于指定C++的标准版本。

-I<dir>：添加头文件搜索路径。例如，-I/usr/local/include会告诉编译器在/usr/local/include目录下搜索头文件。

-L<dir>：添加库搜索路径。例如，-L/usr/local/lib会告诉编译器在/usr/local/lib目录下搜索库文件。

-l<lib>：链接时使用指定的库。例如，-lmylib会链接名为libmylib.so（Linux）或libmylib.a（静态库）的库。

-pthread：在Linux系统上，如果你的程序使用了POSIX线程（pthreads），需要使用这个选项来链接pthread库。

-fPIC：生成位置无关代码（Position Independent Code），这对于创建共享库是必要的。

-shared：创建共享库（动态库）。

-static：创建静态库或静态链接程序，不使用任何动态库。