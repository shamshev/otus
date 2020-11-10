# ansible example

простой пример плэйбука для запуска докер-контейнера


на практике я бы делал немного по-другому:

- с чистым докером неудобно работать - docker-compose для таких целей удобнее

- установку докера и подготовку yml-файла для docker-compose надо разнести по 2 плэйбукам


инфа по модулю: https://docs.ansible.com/ansible/latest/modules/docker_container_module.html
