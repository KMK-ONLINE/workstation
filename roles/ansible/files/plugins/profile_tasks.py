import time


class CallbackModule(object):
    """
    A plugin for timing tasks
    """
    def __init__(self):
        self.stats = {}
        self.current = None

    def playbook_on_task_start(self, name, is_conditional):
        """
        Logs the start of each task
        """
        if self.current is not None:
            # Record the running time of the last executed task
            self.stats[self.current] = time.time() - self.stats[self.current]

        # Record the start time of the current task
        self.current = name
        self.stats[self.current] = time.time()

    def playbook_on_stats(self, stats):
        """
        Prints the timings
        """
        # Record the timing of the very last task
        if self.current is not None:
            self.stats[self.current] = time.time() - self.stats[self.current]

        # Sort the tasks by their running time
        results = sorted(
            self.stats.items(),
            key=lambda value: value[1],
            reverse=True,
        )
        # timing function whole process
        def count_in_total(my_results):
            timing = 0
            for elapsed in my_results:
                timing += elapsed[1]
            return timing

        # Get Total of whole process
        total_sum_time = count_in_total(results)

        # Just keep the top 10
        results = results[:10]

        # Print the timings
        for name, elapsed in results:
            print(
                "{0:-<70}{1:->9}".format(
                    '{0} '.format(name),
                    ' {0:.02f}s'.format(elapsed),
                )
            )

        # Get Total of top 10 process
        total_timing = count_in_total(results)

        print "TOTAL: Executable Top 10 Running Process Time : ",' {0:.02f}s'.format(total_timing)
        print "TOTAL: ALL: Executable Running Process Time : ",' {0:.02f}s'.format(total_sum_time)
