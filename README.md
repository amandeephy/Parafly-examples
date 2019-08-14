# Parafly-examples
An example CMS job parallelized using Parafly 

Parafly is a PBS option that helps you parallelize inputs across processors on a given cluster node.
The example uses the hammer cluster at Purude, where in there are 20 processors per node.

The input file takes in the command to be executed per processor, while the example file is the submission file with all the PBS directives.

To submit just : qsub Parafly_example

