        if [ -f /etc/mysql/mariadb.conf.d/50-server.cnf ] ; then
                sed -i -- 's/bind-address/# bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
                sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf
                output 'Restarting MySQL process...'
                service mysql restart
        elif [ -f /etc/mysql/my.cnf ] ; then
                sed -i -- 's/bind-address/# bind-address/g' /etc/mysql/my.cnf
                sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/mysql/my.cnf
                output 'Restarting MySQL process...'
                service mysql restart
        elif [ -f /etc/my.cnf ] ; then
                sed -i -- 's/bind-address/# bind-address/g' /etc/my.cnf
                sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/my.cnf
                output 'Restarting MySQL process...'
                service mysql restart
        elif [ -f /etc/mysql/my.conf.d/mysqld.cnf ] ; then
                sed -i -- 's/bind-address/# bind-address/g' /etc/mysql/my.conf.d/mysqld.cnf
                sed -i '/\[mysqld\]/a bind-address = 0.0.0.0' /etc/mysql/my.conf.d/mysqld.cnf
                output 'Restarting MySQL process...'
                service mysql restart
        else
                output 'File my.cnf was not found! Please contact support.'
        fi
