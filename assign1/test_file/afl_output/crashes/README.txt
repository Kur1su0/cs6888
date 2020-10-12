Command line used to find this crash:

/root/git/cs6888/assign1/afl-2.52b/afl-fuzz -i afl_input -o afl_output /root/git/cs6888/assign1/tcc-0.9.27/tcc -I /root/git/cs6888/assign1/tcc-0.9.27/lib/tcc/include -o /root/git/cs6888/assign1/test_file/hello @@

If you can't reproduce a bug outside of afl-fuzz, be sure to set the same
memory limit. The limit used for this fuzzing session was 50.0 MB.

Need a tool to minimize test cases before investigating the crashes or sending
them to a vendor? Check out the afl-tmin that comes with the fuzzer!

Found any cool bugs in open-source tools using afl-fuzz? If yes, please drop
me a mail at <lcamtuf@coredump.cx> once the issues are fixed - I'd love to
add your finds to the gallery at:

  http://lcamtuf.coredump.cx/afl/

Thanks :-)
