package com.kshl.sharding;

import com.dangdang.ddframe.rdb.sharding.api.ShardingValue;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.SingleKeyTableShardingAlgorithm;
import com.google.common.collect.Range;

import java.util.Collection;
import java.util.LinkedHashSet;

/**
 * Created by xufengfeng on 2017/6/8.
 */
public class KSSingleKeyByEntCodeTableShardingAlgorithm implements SingleKeyTableShardingAlgorithm<String> {

    @Override
    public String doEqualSharding(Collection<String> availableTargetNames, ShardingValue<String> shardingValue) {
        return getTableName(shardingValue);
    }

    @Override
    public Collection<String> doInSharding(Collection<String> availableTargetNames, ShardingValue<String> shardingValue) {
        return getTableNames(shardingValue);
    }

    @Override
    public Collection<String> doBetweenSharding(Collection<String> availableTargetNames, ShardingValue<String> shardingValue) {
        return getTableNames(shardingValue);
    }


    private Collection<String> getTableNames(ShardingValue<String> shardingValue) {
        Collection<String> result = new LinkedHashSet<>();
        result.add(getTableName(shardingValue));
        return result;
    }

    private String getTableName(ShardingValue<String> shardingValue) {
        return "ks_code_" + shardingValue.getValue().substring(0, 5);
    }
}
