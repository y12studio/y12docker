https://github.com/corda/corda/tree/master/tools/explorer

Thu Dec  1 16:22:00 CST 2016

```
$ date && docker -v
Thu Dec  1 16:22:00 CST 2016
Docker version 1.12.3, build 6b644ec
$ docker build -t corda .
$ docker run -it corda bash
# gradle -v

------------------------------------------------------------
Gradle 3.2.1
------------------------------------------------------------

Build time:   2016-11-22 15:19:54 UTC
Revision:     83b485b914fd4f335ad0e66af9d14aad458d2cc5

Groovy:       2.4.7
Ant:          Apache Ant(TM) version 1.9.6 compiled on June 29 2015
JVM:          1.8.0_112 (Oracle Corporation 25.112-b15)
OS:           Linux 3.13.0-100-generic amd64
# ./gradlew install

....
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':client:compileKotlin'.
> Compilation error. See log for more details

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output.

BUILD FAILED

```
