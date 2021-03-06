FINEGRAINED_SUPPORTED=yes
NAMEEXTRA=

run_bench() {
	VERSION_PARAM=
	if [ "$FUTEXBENCH_WORKLOADS" = "" ]; then
		FUTEXBENCH_WORKLOADS=hash
		$SHELLPACK_INCLUDE/shellpack-bench-futexbench $VERSION_PARAM
		return $?
	fi
	if [ "$FUTEXBENCH_VERSION" != "" ]; then
		VERSION_PARAM="-v $FUTEXBENCH_VERSION"
	fi

	$SHELLPACK_INCLUDE/shellpack-bench-futexbench $VERSION_PARAM	\
		--min-threads $FUTEXBENCH_MIN_THREADS			\
		--max-threads $FUTEXBENCH_MAX_THREADS			\
		--workloads $FUTEXBENCH_WORKLOADS

	return $?
}
