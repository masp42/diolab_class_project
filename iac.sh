#!/bin/bash

echo "Iniciando script de configuração..."

echo "Criando diretórios (se ainda não existirem)..."
[ ! -d /publico ] && mkdir /publico
[ ! -d /adm ] && mkdir /adm
[ ! -d /ven ] && mkdir /ven
[ ! -d /sec ] && mkdir /sec

echo "Criando grupos de usuários..."
getent group GRP_ADM >/dev/null || groupadd GRP_ADM
getent group GRP_VEN >/dev/null || groupadd GRP_VEN
getent group GRP_SEC >/dev/null || groupadd GRP_SEC

echo "Criando usuários e atribuindo aos grupos..."

# Usuários ADM
for user in jose carla neno; do
    id -u $user &>/dev/null || useradd $user -m -s /bin/bash -G GRP_ADM
    echo "$user:Senha123" | chpasswd
done

# Usuários VEN
for user in janaina isabel marcelo; do
    id -u $user &>/dev/null || useradd $user -m -s /bin/bash -G GRP_VEN
    echo "$user:Senha123" | chpasswd
done

# Usuários SEC
for user in fernanda floripes cristovao; do
    id -u $user &>/dev/null || useradd $user -m -s /bin/bash -G GRP_SEC
    echo "$user:Senha123" | chpasswd
done

echo "Definindo permissões de diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Script finalizado com sucesso!"
