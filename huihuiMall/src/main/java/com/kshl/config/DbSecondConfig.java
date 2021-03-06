package com.kshl.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * Created by xufengfeng on 2017/6/15.
 */
@Configuration
@ConfigurationProperties("spring.datasource.second")
@MapperScan(basePackages = DbSecondConfig.Package, sqlSessionFactoryRef = "secondSqlSessionFactory")
public class DbSecondConfig extends DbConfigBase {

    static final String Package = "com.kshl.huihuimall.base.dal.manualmapper";

    @Bean(name = "secondDataSource")
    public DataSource secondDataSource() {

        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setDriverClassName(getDriverClassName());
        druidDataSource.setUrl(getUrl());
        druidDataSource.setUsername(getUsername());
        druidDataSource.setPassword(getPassword());
        druidDataSource.setInitialSize(getInitialSize());
        druidDataSource.setMaxActive(getMaxActive());
        druidDataSource.setMinIdle(getMinIdle());

        return druidDataSource;
    }


    @Bean(name = "secondSqlSessionFactory")
    public SqlSessionFactory secondSqlSessionFactory(@Qualifier("secondDataSource") DataSource secondDataSource)
            throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(secondDataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources("classpath*:mappers/**/manual/*Mapper.xml"));
        return sessionFactory.getObject();
    }
}
