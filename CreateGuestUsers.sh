#!/bin/bash

echo "Criando usuários do sistema..."

for user in convidado1 convidado2 convidado3 convidado4; do
    useradd $user -c "Usuário convidado" -s /bin/bash -m
    echo "$user:Senha123" | chpasswd
    passwd $user -e
done

echo "Finalizado!!"