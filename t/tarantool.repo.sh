# Clean up yum cache
yum clean all
# Add Tarantool repository
rm -f /etc/yum.repos.d/*tarantool*.repo
tee /etc/yum.repos.d/tarantool_1_7.repo <<- EOF
[tarantool_1_7]
name=EnterpriseLinux-\$releasever - Tarantool
baseurl=http://download.tarantool.org/tarantool/1.7/el/\$releasever/\$basearch/
gpgkey=http://download.tarantool.org/tarantool/1.7/gpgkey
repo_gpgcheck=1
gpgcheck=0
enabled=1

[tarantool_1_7-source]
name=EnterpriseLinux-\$releasever - Tarantool Sources
baseurl=http://download.tarantool.org/tarantool/1.7/el/\$releasever/SRPMS
gpgkey=http://download.tarantool.org/tarantool/1.7/gpgkey
repo_gpgcheck=1
gpgcheck=0
EOF

# Update metadata
yum makecache -y --disablerepo='*' --enablerepo='tarantool_1_7'

# Install Tarantool
yum -y install tarantool