TLDR; 

after entering this directory: 

`chmod +x *.sh `

this will allow the scripts to be run 

`TREEDEPTH=12`

Sets a very quick, proof of concept only level to test that everything is working correctly 

`./detect_avx`

Shows what flags are supported on the host system, and therefore should be explitly passed to the compiler. 
For certain platforms which were heavilly segmented, this ensures that all compilers have the same knowledge of underlying hardware support. 
 
Use the above results to set CFLAGS, OldCflags and LegacyCflags (used for gcc 10>=, gcc 8-9 and gcc7=< respectively due to differing instruction support.)

`./quick_benchmark`

After confirming the above works, set `TREEDEPTH=22` to produce relevant results

quick_benchmark will use the maximum possible optimization flags for each compiler, ignoring the default cases that most users who don't care about performance (and consequentially would have no interest in this sort of program/testing would use. They are used in `./benchmark` to serve as a point of comparison of what each compiler can do as its baseline.)

For best results of specific optimal code paths, use `TREEDEPTH>=28`. The test will take a while, but produce results that give high relative precision 
