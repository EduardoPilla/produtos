dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
        logSql = true
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    show_sql = true
    format_sql=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"

                        dbCreate = "update"
			driverClassName = "org.postgresql.Driver"
                        username = "click"
                        password = "senha"
                        url = "jdbc:postgresql://127.0.0.1/crialista"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			driverClassName = "org.postgresql.Driver"
                        username = "click"
                        password = "senha"
                   url = "jdbc:postgresql://127.0.0.1/crialista"
		}
	}

    
}