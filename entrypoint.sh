#!/bin/bash

base_dir=`find /project/target/target -maxdepth 1 -name "scala-*" | head -1`
classes_dir="$base_dir/classes"
test_classes_dir="$base_dir/test-classes"
answer_dir=/project/answer
compiled_answer_dir=/project/compiled_answer

# Compile the user's code
mkdir -p "$compiled_answer_dir"
find "$answer_dir" -name *.scala \
	| xargs scalac -classpath "$classes_dir" -d "$compiled_answer_dir"

# Find dependencies
lib_jars=`find ~/.ivy2 -name "*.jar" | tr '\n' ':'`

# Run the given test(s)
scala \
	-classpath "$compiled_answer_dir:$test_classes_dir:$classes_dir:$lib_jars" \
	org.scalatest.tools.Runner -R "$test_classes_dir" -o -s $1
