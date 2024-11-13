set hive.support.sql11.reserved.keywords=false;

set hive.execution.engine=tez;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;
set hive.vectorized.execution.enabled=true;
set hive.vectorized.execution.reduce.enabled = true;
set hive.vectorized.execution.reduce.groupby.enabled = true;

set hive.exec.parallel=true;
set hive.exec.parallel.thread.number=16;

set hive.exec.dynamic.partition.mode=nonstrict;

#There is a danger with many partition columns to generate many broken files in ORC.  To prevent that
set hive.optimize.sort.dynamic.partition=true;
hive.optimize.sort.dynamic.partition = false



-- // To Generate Statistics for Entire Table and Columns for All Days (Longer)

ANALYZE TABLE rawlogs.benchmark_rawlogs_orc partition (p_silo, p_day, p_clienthash) COMPUTE STATISTICS;

ANALYZE TABLE rawlogs.benchmark_rawlogs_orc partition (p_silo, p_day, p_clienthash) COMPUTE STATISTICS for columns;


--------


explain SELECT schema.table,

-
-
-
-
-
- limit 20;


# set mapred.reduce.tasks = 38; -- not recommemded

#Let Tez determine this

set mapred.reduce.tasks = -1;
set hive.tez.auto.reducer.parallelism
set hive.tez.auto.reducer.parallelism;
set hive.tez.auto.reducer.parallelism = true;

hive.tez.min.partition.factor=0.25;
hive.tez.max.partition.factor=2.0;

/* The third property is hive.exec.reducers.max which determines the maximum number of reducers. By default it is 1099.
*/


-- hive.exec.reducers.bytes.per.reducer


/*
The FORMULA

So to put it all together Hive/ Tez estimates number of reducers using the following formula and then schedules the Tez DAG
Max(1, Min(hive.exec.reducers.max [1099], ReducerStage estimate/hive.exec.reducers.bytes.per.reducer))  x  hive.tez.max.partition.factor [2]
*/ 




--set hive.tez.auto.reducer.parallelism;
set hive.tez.auto.reducer.parallelism=true
--set hive.tez.min. partition.factor; 
set hive.tez.min.partition.factor=0.25
--set hive.tez.max.partition.factor; 
set hive.tez.max.partition.factor=2.0
--set hive.exec.reducers.bytes.per.reducer; 
--hive.exec.reducers.bytes.per.reducer=258998272 
--set hive.exec.reducers.bytes.per.reducer = 134217728;
set hive.exec.reducers.bytes.per.reducer=10432; 


set hive.optimize.reducededuplication.min.reducer = 1;
hive.exec.reducers.bytes.per.reducer=1073741824; // 1gb
tez.shuffle-vertex-manager.min-src-fraction=0.25;
tez.shuffle-vertex-manager.max-src-fraction=0.75;
tez.runtime.pipelined.sorter.lazy-allocate.memory=true;


set hive.optimize.ppd=true;  -- Predicate Pushdown
set hive.optimize.index.filter=true;


