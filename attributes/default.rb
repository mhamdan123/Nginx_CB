case node["platform"]
when "ubuntu"
        default["pakage_name_nginx"] = 'nginx', 'nginx-common', 'nginx-core', 'nginx-core-dbg', 'nginx-doc', 'nginx-extras', 'nginx-extras-dbg', 'nginx-full', 'nginx-full-dbg'
when "centos"
        default["pakage_name_nginx"] = 'nginx', 'nginx-all-modules'
when "amazon"
        default["pakage_name_nginx"] = 'nginx', 'nginx-all-modules'
end
