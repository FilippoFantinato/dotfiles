#!/bin/bash

exercise_dir='exercises'

for file in `ls $exercise_dir`; do
	python english-solutions.py $exercise_dir/$file solutions
done
