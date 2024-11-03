# -*- coding: UTF-8 -*-
""" 配置服务 """

import os, uuid


def main():
    username = "root"
    password = uuid.uuid4().hex[:8]
    initial_mysql_cmd = """
    FLUSH PRIVILEGES;
    # UPDATE mysql.user SET Password=PASSWORD('{password}') WHERE User='{username}';
    # update mysql.user set authentication_string=password('{password}'), plugin='mysql_native_password' where user='{username}';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '{password}';
    FLUSH PRIVILEGES;
    """.format(
        username=username, password=password
    )
    result = os.system(
        """mysql -Bse "{initial_mysql_cmd}";""".format(
            initial_mysql_cmd=initial_mysql_cmd
        )
    )
    if not result:
        with open("/opt/xy_base/mysql/.root_key.txt", "w") as f:
            f.write(
                f"""{username}
{password}
"""
            )


if __name__ == "__main__":
    main()
