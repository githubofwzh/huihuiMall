package com.kshl.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.dangdang.ddframe.rdb.sharding.api.ShardingDataSourceFactory;
import com.dangdang.ddframe.rdb.sharding.api.rule.DataSourceRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.ShardingRule;
import com.dangdang.ddframe.rdb.sharding.api.rule.TableRule;
import com.dangdang.ddframe.rdb.sharding.api.strategy.table.TableShardingStrategy;
import com.kshl.sharding.KSSingleKeyByEntCodeTableShardingAlgorithm;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by xufengfeng on 2017/6/15.
 */
@Configuration
@ConfigurationProperties("spring.datasource")
@MapperScan(basePackages = DbPrimaryConfig.Package, sqlSessionFactoryRef = "primarySqlSessionFactory")
public class DbPrimaryConfig extends DbConfigBase{

    static final String Package = "com.kshl.huihuimall.base.dal.mapper";

    @Primary
    @Bean(name = "primaryDataSource")
    public DataSource primaryDataSource() {

        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setDriverClassName(getDriverClassName());
        druidDataSource.setUrl(getUrl());
        druidDataSource.setUsername(getUsername());
        druidDataSource.setPassword(getPassword());
        druidDataSource.setInitialSize(getInitialSize());
        druidDataSource.setMaxActive(getMaxActive());
        druidDataSource.setMinIdle(getMinIdle());

        Map<String,DataSource> dataSourceMap = new HashedMap();
        dataSourceMap.put("ds_0", druidDataSource);
        DataSourceRule dataSourceRule = new DataSourceRule(dataSourceMap);

        //tableShardingStrategy
        TableShardingStrategy tableShardingStrategy = new TableShardingStrategy("code", new KSSingleKeyByEntCodeTableShardingAlgorithm());

        //tableRule
        TableRule tableRule = new TableRule.TableRuleBuilder("ks_code")
                .dynamic(true)
                .dataSourceRule(dataSourceRule)
//                .autoIncrementColumns("id")
//                .tableIdGenerator(CommonSelfIdGenerator.class)
                .build();

        //shardingRule
        ShardingRule shardingRule = ShardingRule.builder()
                .dataSourceRule(dataSourceRule)
                .tableRules(Arrays.asList(tableRule))
                .tableShardingStrategy(tableShardingStrategy)
                .build();

        return ShardingDataSourceFactory.createDataSource(shardingRule);
    }

    @Primary
    @Bean(name = "primarySqlSessionFactory")
    public SqlSessionFactory primarySqlSessionFactory(@Qualifier("primaryDataSource") DataSource primaryDataSource)
            throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(primaryDataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources("classpath*:mappers/**/auto/*Mapper.xml"));
        return sessionFactory.getObject();
    }


}
