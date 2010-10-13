dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
	stg{
//		SQLServer Express 2005
//		dataSource{
//			pooled = false
//			driverClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
//			username = "sa"
//			password = "BySouleater123"
//			dbCreate = "update"
//			url = "jdbc:sqlserver://localhost:1433;databaseName=aristeia_online;"
//		}	
		
//		MySQL
		dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = "BySouleater"
			dbCreate = "update"
			url = "jdbc:mysql://localhost:3306/test"
		}
		hibernate {
			cache.use_second_level_cache=true
			cache.use_query_cache=true
			cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
		}
	}
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
