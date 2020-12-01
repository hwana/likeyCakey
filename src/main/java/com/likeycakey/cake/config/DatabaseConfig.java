package com.likeycakey.cake.config;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
//@MapperScan(basePackages = "com.likeycakey.cake.**.dao")
public class DatabaseConfig {

    @Bean("sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setConfigLocation(resolver.getResource("classpath:mybatis-config.xml"));
//        sqlSessionFactoryBean.setMapperLocations(resolver.getResource("classpath:mappers/*.xml"));  // <-- 이렇게 지정
        return sqlSessionFactoryBean.getObject();
    }



}
