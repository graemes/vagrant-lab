class yum {
exec
{
"yum-update":
command => "/usr/bin/yum clean all; /usr/bin/yum -q -y update",
timeout => 1800, 
}
}

 